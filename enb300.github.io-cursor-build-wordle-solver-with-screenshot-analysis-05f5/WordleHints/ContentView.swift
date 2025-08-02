import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WordleFinderView()
                .navigationTitle("Wordle Hints")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}