# Wordle Hints - iOS App

A powerful iOS application that helps you solve Wordle puzzles with both manual input and automatic screenshot analysis capabilities.

## Features

### 🎯 Core Functionality
- **Manual Letter Input**: Enter known correct letters (green), misplaced letters (yellow), and excluded letters (gray)
- **Smart Word Filtering**: Advanced algorithm to filter valid words based on all constraints
- **NYT Word List**: Option to search only within New York Times Wordle answers or use extended word database
- **Position-Aware Constraints**: Handles complex scenarios where letters must be included but excluded from specific positions

### 📸 Screenshot Analysis (Advanced)
- **Camera Integration**: Take photos directly from the app to analyze Wordle screenshots
- **Photo Library Access**: Select existing Wordle screenshots from your photo library
- **Computer Vision**: Uses Apple's Vision framework to extract letter states from images
- **Auto-Population**: Automatically fills in correct, misplaced, and excluded letters from analyzed screenshots
- **Keyboard Detection**: Identifies eliminated letters from the on-screen keyboard

### 🎨 User Interface
- **word.tips Inspired**: Clean, intuitive interface matching the popular Wordle helper website
- **SwiftUI Modern Design**: Native iOS design with smooth animations and interactions
- **Color-Coded Input**: Green, yellow, and gray visual indicators matching Wordle's color scheme
- **Responsive Layout**: Optimized for all iPhone and iPad screen sizes

## Technical Implementation

### Architecture
- **SwiftUI**: Modern declarative UI framework
- **MVVM Pattern**: Clean separation of concerns with ObservableObject view models
- **Vision Framework**: Apple's computer vision for text recognition and image analysis
- **PhotosUI**: Native photo selection and camera integration

### Key Components

#### WordleSolver
The core logic engine that:
- Manages letter constraints (correct, misplaced, excluded)
- Filters word database based on all active constraints
- Handles complex scenarios like letters that must be included but excluded from specific positions
- Provides sorted suggestions based on probability

#### ImageAnalyzer
Advanced computer vision component that:
- Processes Wordle screenshots using Vision framework
- Extracts text from letter tiles
- Identifies tile colors (green, yellow, gray) - *Future enhancement*
- Maps letters to specific grid positions
- Detects eliminated letters from keyboard area

#### WordList
Comprehensive word database featuring:
- 500+ New York Times Wordle answers
- 2000+ valid 5-letter words for extended searching
- Helper methods for prefix and content-based filtering

#### UI Components
- **LetterInputView**: Reusable single-letter input with color coding
- **WordleFinderView**: Main interface with all input sections
- **WordSuggestionsView**: Clean list of suggested words
- **CameraView**: Native camera integration

## Installation & Setup

### Requirements
- iOS 17.0 or later
- Xcode 15.0 or later
- iPhone or iPad with camera (for screenshot analysis)

### Build Instructions
1. Clone this repository
2. Open `WordleHints.xcodeproj` in Xcode
3. Select your target device or simulator
4. Build and run (⌘+R)

### Permissions
The app requests the following permissions:
- **Camera Access**: To take photos of Wordle screens for analysis
- **Photo Library Access**: To select existing Wordle screenshots

## Usage Guide

### Manual Input Method
1. **Correct Letters (Green)**: Tap the green letter boxes and enter letters you know are in the correct position
2. **Misplaced Letters (Yellow)**: Enter letters that are in the word but in the wrong position
3. **Excluded Letters (Gray)**: Type letters that have been eliminated
4. **Search**: Tap the orange "Search" button to get word suggestions
5. **NYT Filter**: Toggle the checkbox to limit results to official NYT Wordle answers

### Screenshot Analysis Method
1. **Take Photo**: Tap "Take Photo" to capture a screenshot of your Wordle game
2. **Choose Photo**: Select an existing screenshot from your photo library
3. **Auto-Fill**: The app will automatically detect and fill in letter constraints
4. **Review & Search**: Verify the detected letters and tap "Search" for suggestions

### Tips for Best Results
- Ensure Wordle screenshots are clear and well-lit
- Include both the game grid and keyboard in screenshots for complete analysis
- Manually verify auto-detected letters before searching
- Use "Clear All" to reset all inputs for a new puzzle

## Future Enhancements

### Planned Features
- **Enhanced Color Detection**: More accurate tile color recognition
- **Multiple Game Support**: Expand to support Wordle variants (6-letter, themed words)
- **Statistics Tracking**: Track your solving success rate
- **Sharing Integration**: Share interesting puzzles and solutions
- **Dark Mode**: Full dark mode support
- **Accessibility**: VoiceOver and other accessibility improvements

### Advanced Computer Vision
- **Precise Grid Detection**: More accurate identification of the 5x6 Wordle grid
- **Color Analysis**: RGB-based tile color detection for improved accuracy
- **Keyboard State Detection**: Better recognition of eliminated letters from keyboard
- **Multiple Screenshot Formats**: Support for different Wordle apps and variations

## Contributing

We welcome contributions! Areas where help is needed:
- **Computer Vision**: Improving screenshot analysis accuracy
- **Word Database**: Expanding and curating the word lists
- **UI/UX**: Enhancing the user interface and experience
- **Testing**: Testing on various devices and iOS versions

## License

This project is created for educational and personal use. Wordle is a trademark of The New York Times Company.

## Acknowledgments

- Inspired by word.tips for the clean interface design
- Uses Apple's Vision framework for computer vision capabilities
- Word lists compiled from various public domain sources
- Built with SwiftUI and modern iOS development practices
