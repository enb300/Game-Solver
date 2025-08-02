# Game Solver - NYT Wordle Solver

A comprehensive iPhone app for solving NYT games, starting with Wordle. This app combines manual input functionality with screenshot analysis to automatically extract game state from Wordle screenshots.

## Features

### Current Features
- **Manual Input Interface**: Resembles the word.tips Wordle Word Finder interface
- **Screenshot Analysis**: Upload screenshots to automatically extract game state
- **Word Filtering**: Uses official NYT Wordle word list for accurate suggestions
- **Real-time Results**: Displays up to 50 suggested words based on current game state
- **Clean UI**: Modern, intuitive interface with color-coded sections

### Screenshot Analysis Capabilities
The app can analyze Wordle screenshots to extract:
- **Correct Letters**: Green tiles (letters in correct position)
- **Misplaced Letters**: Yellow tiles (letters in wrong position)
- **Excluded Letters**: Dark grey tiles (letters not in the word)

## Technical Implementation

### Architecture
- **SwiftUI**: Modern declarative UI framework
- **Vision Framework**: OCR for text recognition in screenshots
- **Core Image**: Image processing and color analysis
- **PhotosUI**: Image picker for screenshot selection

### Key Components

#### ContentView.swift
Main interface with:
- Screenshot upload section
- Manual input sections for correct, misplaced, and excluded letters
- Search and clear functionality
- Results display grid

#### WordleSolver.swift
Core logic for:
- Word filtering based on game state
- State management with @Published properties
- Integration with screenshot analysis

#### ScreenshotAnalyzer.swift
Computer vision implementation for:
- Text recognition using Vision framework
- Color analysis for tile states
- Position mapping for grid layout

#### WordList.swift
Contains the official NYT Wordle word list for accurate filtering.

## Future Enhancements

### Screenshot Analysis Improvements
1. **Enhanced Color Detection**: Implement more sophisticated color analysis using Core Image filters
2. **Grid Detection**: Add automatic Wordle grid detection and positioning
3. **Keyboard Analysis**: Improve keyboard state detection for excluded letters
4. **Multiple Game Support**: Extend to support other NYT games (Connections, Mini Crossword, etc.)

### UI/UX Enhancements
1. **Dark Mode Support**: Add dark mode theme
2. **Accessibility**: Improve VoiceOver and accessibility features
3. **Animations**: Add smooth transitions and feedback animations
4. **Statistics**: Track solving performance and statistics

### Advanced Features
1. **Machine Learning**: Implement ML models for better screenshot analysis
2. **Game History**: Save and analyze past games
3. **Sharing**: Share results and statistics
4. **Offline Mode**: Cache word lists for offline use

## Installation

1. Open the project in Xcode
2. Select your target device or simulator
3. Build and run the project

## Usage

### Manual Input
1. Enter correct letters in the green section
2. Enter misplaced letters in the yellow section
3. Enter excluded letters in the excluded section
4. Tap "Search" to see suggested words

### Screenshot Analysis
1. Tap "Select Screenshot" to choose a Wordle screenshot
2. The app will automatically analyze the image
3. Game state will be populated in the input fields
4. Review and adjust if needed, then search for suggestions

## Technical Notes

### Screenshot Analysis Limitations
The current screenshot analysis is a foundation that can be enhanced with:
- More sophisticated color detection algorithms
- Better position mapping for different screen sizes
- Improved OCR accuracy for various fonts and backgrounds

### Performance Considerations
- Word filtering is optimized for the official NYT word list
- Screenshot analysis runs on background threads to maintain UI responsiveness
- Results are limited to 50 words for performance

## Contributing

This project is designed to be extensible for additional NYT games. The modular architecture allows for easy addition of new game solvers while maintaining the core screenshot analysis capabilities.

## License

This project is for educational and personal use. Please respect NYT's terms of service when using this app. 