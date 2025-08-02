import Foundation
import SwiftUI
import Vision
import PhotosUI

class ImageAnalyzer: ObservableObject {
    @Published var analysisResult: ImageAnalysisResult?
    @Published var isAnalyzing: Bool = false
    
    func analyzePhoto(_ photoItem: PhotosPickerItem) async {
        guard let imageData = try? await photoItem.loadTransferable(type: Data.self),
              let image = UIImage(data: imageData) else {
            return
        }
        
        await MainActor.run {
            self.isAnalyzing = true
        }
        
        analyzeImage(image)
    }
    
    func analyzeImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.performTextRecognition(on: cgImage)
        }
    }
    
    private func performTextRecognition(on cgImage: CGImage) {
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print("Text recognition error: \(error)")
                return
            }
            
            self.processTextRecognitionResults(request.results as? [VNRecognizedTextObservation] ?? [])
        }
        
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = false
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        try? handler.perform([request])
    }
    
    private func processTextRecognitionResults(_ observations: [VNRecognizedTextObservation]) {
        var correctLetters: [Int: String] = [:]
        var misplacedLetters: [Int: String] = [:]
        var excludedLetters: [String] = []
        
        // This is a simplified analysis - in a real implementation, you would:
        // 1. Use color detection to identify green/yellow/gray tiles
        // 2. Map the recognized text to specific positions
        // 3. Handle the keyboard area separately from the game grid
        
        for observation in observations {
            guard let topCandidate = observation.topCandidates(1).first else { continue }
            
            let text = topCandidate.string.uppercased()
            
            // Simple pattern matching for demonstration
            // In reality, you'd need sophisticated computer vision to:
            // - Detect tile colors (green, yellow, gray)
            // - Map letters to specific positions
            // - Distinguish between game grid and keyboard
            
            for char in text {
                if char.isLetter {
                    let letter = String(char)
                    
                    // This is placeholder logic - replace with actual color detection
                    // For now, we'll simulate some analysis results
                    if letter == "A" { // Simulate green tile
                        correctLetters[1] = letter
                    } else if letter == "U" { // Simulate yellow tile
                        misplacedLetters[2] = letter
                    } else if ["E", "R", "Y", "I", "O", "S", "L", "B", "G", "H"].contains(letter) {
                        if !excludedLetters.contains(letter) {
                            excludedLetters.append(letter)
                        }
                    }
                }
            }
        }
        
        let result = ImageAnalysisResult(
            correctLetters: correctLetters,
            misplacedLetters: misplacedLetters,
            excludedLetters: excludedLetters
        )
        
        DispatchQueue.main.async {
            self.analysisResult = result
            self.isAnalyzing = false
        }
    }
    
    // Enhanced color-based analysis (placeholder for advanced implementation)
    private func analyzeWordleScreenshot(_ cgImage: CGImage) {
        // This would involve:
        // 1. Detecting the Wordle grid area
        // 2. Segmenting individual letter tiles
        // 3. Analyzing tile colors (green: #6aaa64, yellow: #c9b458, gray: #787c7e)
        // 4. OCR on each tile to get the letter
        // 5. Mapping letters to positions and states
        // 6. Detecting keyboard area and excluded letters
        
        // For now, this is a placeholder that demonstrates the structure
        
        let request = VNDetectRectanglesRequest { request, error in
            guard let observations = request.results as? [VNRectangleObservation] else { return }
            
            // Process detected rectangles (tiles)
            for rectangle in observations {
                // Extract tile region
                // Analyze color
                // Perform OCR on tile
                // Map to correct/misplaced/excluded
            }
        }
        
        request.minimumAspectRatio = 0.8
        request.maximumAspectRatio = 1.2
        request.minimumSize = 0.01
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? handler.perform([request])
    }
}