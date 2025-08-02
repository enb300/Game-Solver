import SwiftUI

struct LetterInputView: View {
    @Binding var letter: String
    let color: Color
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("", text: $letter)
            .font(.title2)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .textCase(.uppercase)
            .autocapitalization(.allCharacters)
            .disableAutocorrection(true)
            .focused($isFocused)
            .frame(width: 50, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color, lineWidth: 2)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(letter.isEmpty ? Color.clear : color.opacity(0.2))
                    )
            )
            .onChange(of: letter) { _, newValue in
                // Limit to single character and make uppercase
                if newValue.count > 1 {
                    letter = String(newValue.last ?? Character(""))
                } else {
                    letter = newValue.uppercased()
                }
            }
            .onTapGesture {
                isFocused = true
            }
    }
}

#Preview {
    VStack(spacing: 20) {
        LetterInputView(letter: .constant("A"), color: .green)
        LetterInputView(letter: .constant(""), color: .yellow)
        LetterInputView(letter: .constant("N"), color: .gray)
    }
    .padding()
}