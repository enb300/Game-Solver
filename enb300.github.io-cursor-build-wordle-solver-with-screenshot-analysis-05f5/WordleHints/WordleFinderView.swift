import SwiftUI
import PhotosUI

struct WordleFinderView: View {
    @StateObject private var solver = WordleSolver()
    @StateObject private var imageAnalyzer = ImageAnalyzer()
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var isNYTOnly = false
    @State private var showingImagePicker = false
    @State private var showingCamera = false
    @State private var showingSuggestions = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 16) {
                    Text("Wordle Word Finder")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    HStack {
                        Button(action: { isNYTOnly.toggle() }) {
                            HStack(spacing: 8) {
                                Image(systemName: isNYTOnly ? "checkmark.square.fill" : "square")
                                    .foregroundColor(isNYTOnly ? .green : .gray)
                                Text("New York Times Wordle Answers Only")
                                    .font(.subheadline)
                                    .foregroundColor(.primary)
                            }
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal)
                
                // Screenshot Analysis Section
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "camera.fill")
                            .foregroundColor(.blue)
                        Text("Auto-Fill from Screenshot")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    HStack(spacing: 12) {
                        Button(action: { showingCamera = true }) {
                            HStack {
                                Image(systemName: "camera")
                                Text("Take Photo")
                            }
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(Color.blue)
                            .cornerRadius(10)
                        }
                        
                        PhotosPicker(selection: $selectedPhoto, matching: .images) {
                            HStack {
                                Image(systemName: "photo.on.rectangle")
                                Text("Choose Photo")
                            }
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(Color.green)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Correct Letters Section
                VStack(spacing: 12) {
                    HStack {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 20, height: 20)
                            .cornerRadius(4)
                        Text("Correct Letters")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Spacer()
                        Button("Clear") {
                            solver.clearCorrectLetters()
                        }
                        .foregroundColor(.blue)
                    }
                    
                    Text("Letters in the word and in the correct position (green tiles)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 8) {
                        ForEach(0..<5, id: \.self) { position in
                            LetterInputView(
                                letter: Binding(
                                    get: { solver.correctLetters[position] ?? "" },
                                    set: { solver.setCorrectLetter($0, at: position) }
                                ),
                                color: .green
                            )
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Misplaced Letters Section
                VStack(spacing: 12) {
                    HStack {
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(width: 20, height: 20)
                            .cornerRadius(4)
                        Text("Misplaced Letters")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    Text("Letters in the word but in the wrong position (yellow tiles)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 8) {
                        ForEach(0..<5, id: \.self) { position in
                            LetterInputView(
                                letter: Binding(
                                    get: { solver.misplacedLetters[position] ?? "" },
                                    set: { solver.setMisplacedLetter($0, at: position) }
                                ),
                                color: .yellow
                            )
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Excluded Letters Section
                VStack(spacing: 12) {
                    HStack {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 20, height: 20)
                            .cornerRadius(4)
                        Text("Excluded Letters")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    Text("Letters not in the word in any spot (dark grey tiles)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    
                    TextField("Enter excluded letters", text: $solver.excludedLetters)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textCase(.uppercase)
                        .autocapitalization(.allCharacters)
                        .disableAutocorrection(true)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Search Button
                Button(action: {
                    solver.findSuggestions(nytOnly: isNYTOnly)
                    showingSuggestions = true
                }) {
                    Text("Search")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.orange)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                // Clear All Button
                Button(action: {
                    solver.clearAll()
                }) {
                    Text("Clear All")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .underline()
                }
                .padding(.bottom)
            }
        }
        .onChange(of: selectedPhoto) { _, newPhoto in
            if let newPhoto = newPhoto {
                Task {
                    await imageAnalyzer.analyzePhoto(newPhoto)
                    if let result = imageAnalyzer.analysisResult {
                        solver.applyAnalysisResult(result)
                    }
                }
            }
        }
        .sheet(isPresented: $showingSuggestions) {
            WordSuggestionsView(suggestions: solver.suggestions)
        }
        .fullScreenCover(isPresented: $showingCamera) {
            CameraView { image in
                imageAnalyzer.analyzeImage(image)
                if let result = imageAnalyzer.analysisResult {
                    solver.applyAnalysisResult(result)
                }
            }
        }
    }
}

struct WordSuggestionsView: View {
    let suggestions: [String]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List(suggestions, id: \.self) { word in
                Text(word.uppercased())
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.vertical, 4)
            }
            .navigationTitle("Word Suggestions")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarElements(
                leading: Button("Done") { dismiss() }
            )
        }
    }
}

struct CameraView: UIViewControllerRepresentable {
    let onImageCaptured: (UIImage) -> Void
    @Environment(\.dismiss) private var dismiss
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.onImageCaptured(image)
            }
            parent.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}

extension View {
    func navigationBarElements<L: View>(leading: L) -> some View {
        self.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                leading
            }
        }
    }
}

#Preview {
    WordleFinderView()
}