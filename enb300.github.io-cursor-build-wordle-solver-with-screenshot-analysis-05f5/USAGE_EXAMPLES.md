# Wordle Hints - Usage Examples

This document provides practical examples of how to use the Wordle Hints iOS app effectively.

## Example 1: Manual Input Method

### Scenario: You've played a few guesses in Wordle

**Your game state:**
- Row 1: SLATE - S(gray), L(gray), A(yellow), T(yellow), E(gray)
- Row 2: CHART - C(gray), H(gray), A(green), R(gray), T(gray)
- Row 3: ???

**How to use the app:**

1. **Correct Letters (Green):**
   - Position 3: A (from CHART)

2. **Misplaced Letters (Yellow):**
   - Position 3: A (from SLATE - already handled as correct)
   - Position 4: T (from SLATE)

3. **Excluded Letters (Gray):**
   - Type: SLETCHR

4. **Search Results:**
   - The app will suggest words like: PATIO, AUDIO, QUOTA, etc.

## Example 2: Screenshot Analysis Method

### Scenario: You want to analyze a Wordle screenshot

**Steps:**
1. Take a screenshot of your Wordle game (showing both grid and keyboard)
2. Open the Wordle Hints app
3. Tap "Choose Photo" and select your screenshot
4. The app will automatically detect:
   - Green tiles → Correct letters and positions
   - Yellow tiles → Misplaced letters and positions
   - Gray keyboard keys → Excluded letters
5. Review the auto-filled information
6. Tap "Search" to get suggestions

## Example 3: Advanced Constraint Handling

### Scenario: Complex letter positioning

**Your game state:**
- You know A is in the word but NOT in positions 2 or 4
- You know T is in the word but NOT in position 5
- Letters S, L, E, R are eliminated

**Manual Input:**
1. **Misplaced Letters:**
   - Position 2: A (means A is in word but not position 2)
   - Position 4: A (can add same letter multiple times for different exclusions)
   - Position 5: T
2. **Excluded Letters:** SLER
3. **Search:** Get refined suggestions

## Example 4: Using NYT Filter

### When to use "New York Times Wordle Answers Only":

**Advantages:**
- Smaller, curated word list
- Only contains words that have been or could be NYT Wordle answers
- Higher probability of finding the actual answer

**When to use extended word list:**
- When NYT filter returns no results
- For practicing with unusual words
- For Wordle variants or other word games

## Example 5: Progressive Solving

### Scenario: Working through multiple guesses

**Initial state after ADIEU:**
- A(yellow), D(gray), I(gray), E(gray), U(gray)
- Excluded: DIEU
- Misplaced: A (position 1)

**After STORM:**
- S(gray), T(yellow), O(gray), R(gray), M(gray)
- Excluded: DIEUSORM
- Misplaced: A (position 1), T (position 2)

**Progressive input in app:**
1. First search: Misplaced A, Excluded DIEU
2. Update after STORM: Add T as misplaced, update excluded letters
3. Each search gets more refined results

## Tips for Best Results

### Screenshot Analysis Tips:
- **Lighting:** Ensure good lighting on your screen
- **Angle:** Take photos straight-on to avoid distortion
- **Full Screen:** Include both the game grid and keyboard
- **Clarity:** Use a device with a good camera for better text recognition

### Manual Input Tips:
- **Double-check entries:** Verify correct vs. misplaced letter positioning
- **Use Clear buttons:** Clear sections when making corrections
- **Systematic approach:** Work through each constraint type methodically

### General Strategy:
- **Start broad:** Use common starting words like SLATE, ADIEU, CRANE
- **Narrow down:** Use each guess to eliminate possibilities
- **Think position:** Consider where letters can and cannot go
- **Use frequency:** Choose words with common letters when uncertain

## Common Scenarios & Solutions

### Scenario: No suggestions found
**Cause:** Constraints are too restrictive or contradictory
**Solution:** 
- Review your inputs for errors
- Remove one constraint at a time to find the issue
- Use "Clear All" and re-enter carefully

### Scenario: Too many suggestions
**Cause:** Not enough constraints
**Solution:**
- Enable "NYT Only" filter
- Add more excluded letters
- Consider if you've missed any yellow or green tiles

### Scenario: Screenshot not recognized
**Cause:** Poor image quality or unsupported format
**Solution:**
- Retake with better lighting
- Ensure the Wordle grid is clearly visible
- Try manual input as backup

## Advanced Features Usage

### Multiple Misplaced Letters:
If a letter appears multiple times as misplaced (different positions), you can:
- Enter it in multiple misplaced positions
- This tells the solver the letter is in the word but excluded from those specific positions

### Position-Based Exclusions:
The app automatically handles complex scenarios where:
- A letter must be in the word (from yellow tiles)
- But cannot be in certain positions (from the yellow tile positions)
- And may be confirmed in other positions (from green tiles)

This comprehensive constraint handling makes the app more accurate than simple word filters.