//
//  ContentView.swift
//  Game Solver
//
//  Created by Emma Brown on 8/2/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @StateObject private var wordleSolver = WordleSolver()
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var isAnalyzing = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    
                
                    
                    // Screenshot Analysis Section
                    VStack(spacing: 12) {
                        HStack {
                            Image(systemName: "camera.fill")
                                .foregroundColor(.blue)
                            Text("Screenshot Analysis")
                                .font(.headline)
                        }
                        
                        Text("Upload a screenshot of your Wordle game to automatically extract game state")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            showingImagePicker = true
                        }) {
                            HStack {
                                Image(systemName: "photo.on.rectangle")
                                Text("Select Screenshot")
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                        }
                        
                        if isAnalyzing {
                            HStack {
                                ProgressView()
                                    .scaleEffect(0.8)
                                Text("Analyzing screenshot...")
                                    .font(.caption)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Manual Input Sections
                    VStack(spacing: 20) {
                        // Correct Letters Section
                        LetterInputSection(
                            title: "Correct Letters",
                            description: "Letters in the word and in the correct position (green tiles)",
                            iconColor: .green,
                            letters: $wordleSolver.correctLetters,
                            onClear: { wordleSolver.clearCorrectLetters() }
                        )
                        
                        // Misplaced Letters Section
                        LetterInputSection(
                            title: "Misplaced Letters",
                            description: "Letters in the word but in the wrong position (yellow tiles)",
                            iconColor: .yellow,
                            letters: $wordleSolver.misplacedLetters,
                            onClear: { wordleSolver.clearMisplacedLetters() }
                        )
                        
                        // Excluded Letters Section
                        ExcludedLettersSection(
                            letters: $wordleSolver.excludedLetters,
                            onClear: { wordleSolver.clearExcludedLetters() }
                        )
                    }
                    
                    // Action Buttons
                    VStack(spacing: 12) {
                        Button(action: {
                            wordleSolver.searchWords()
                        }) {
                            Text("Search")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.yellow)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            wordleSolver.clearAll()
                        }) {
                            Text("Clear All")
                                .font(.body)
                                .foregroundColor(.blue)
                                .underline()
                        }
                    }
                    
                    // Results Section
                    if !wordleSolver.suggestedWords.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Suggested Words")
                                .font(.headline)
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 8) {
                                ForEach(wordleSolver.suggestedWords, id: \.self) { word in
                                    Text(word.uppercased())
                                        .font(.system(.body, design: .monospaced))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color(.systemGray5))
                                        .cornerRadius(6)
                                }
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .navigationTitle("Wordle Solver")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
        .onChange(of: selectedImage) { newImage in
            if let image = newImage {
                analyzeScreenshot(image)
            }
        }
    }
    
    private func analyzeScreenshot(_ image: UIImage) {
        isAnalyzing = true
        
        DispatchQueue.global(qos: .userInitiated).async {
            let analyzer = ScreenshotAnalyzer()
            let gameState = analyzer.analyzeWordleScreenshot(image)
            
            DispatchQueue.main.async {
                wordleSolver.updateFromScreenshot(gameState)
                isAnalyzing = false
            }
        }
    }
}

struct LetterInputSection: View {
    let title: String
    let description: String
    let iconColor: Color
    @Binding var letters: [String]
    let onClear: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "square.fill")
                    .foregroundColor(iconColor)
                    .font(.caption)
                Text(title)
                    .font(.headline)
                Spacer()
                Button("Clear") {
                    onClear()
                }
                .font(.caption)
                .foregroundColor(.blue)
            }
            
            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
            
            HStack(spacing: 8) {
                ForEach(0..<5, id: \.self) { index in
                    TextField("", text: Binding(
                        get: { index < letters.count ? letters[index] : "" },
                        set: { newValue in
                            if index < letters.count {
                                letters[index] = newValue.uppercased()
                            } else {
                                while letters.count <= index {
                                    letters.append("")
                                }
                                letters[index] = newValue.uppercased()
                            }
                        }
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 50, height: 50)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .fontWeight(.bold)
                    .background(iconColor.opacity(0.2))
                    .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct ExcludedLettersSection: View {
    @Binding var letters: String
    let onClear: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "square.fill")
                    .foregroundColor(.black)
                    .font(.caption)
                Text("Excluded Letters")
                    .font(.headline)
                Spacer()
                Button(action: onClear) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.black)
                }
            }
            
            Text("Letters not in the word in any spot (dark grey tiles)")
                .font(.caption)
                .foregroundColor(.secondary)
            
            TextField("Enter excluded letters", text: $letters)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.characters)
                .onChange(of: letters) { newValue in
                    letters = newValue.uppercased()
                }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.presentationMode.wrappedValue.dismiss()
            
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    DispatchQueue.main.async {
                        self.parent.selectedImage = image as? UIImage
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
