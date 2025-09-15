# TOKK iOS Internship Test: Mini Chat Assistant

**Time Limit: 2 Hours**

## Overview
Build a simplified chat interface that simulates a conversation with an AI assistant. This test evaluates your SwiftUI skills, MVVM architecture understanding, and ability to create clean, maintainable code.

## Requirements

### Core Features (Must Have)
1. **Chat Interface**: Display messages in a scrollable list
2. **Message Input**: Text field with send button
3. **Mock AI Responses**: Simulate AI responses with predefined logic
4. **Message Types**: Support user and assistant message bubbles with different styling
5. **Auto-scroll**: Automatically scroll to newest messages

### Technical Requirements
- Use **SwiftUI** for all UI components
- Implement **MVVM pattern** with proper separation of concerns
- Handle basic **error states** (empty messages, etc.)
- Use **async/await** for simulated network delays
- Implement proper **state management**

## Starter Code Structure
```
MiniChatApp/
├── Models/
│   ├── Message.swift
│   └── ChatSession.swift
├── ViewModels/
│   └── ChatViewModel.swift
├── Views/
│   ├── ContentView.swift
│   ├── ChatView.swift
│   └── MessageBubbleView.swift
└── Services/
    └── MockAIService.swift
```

## Detailed Specifications

### 1. Message Model
```swift
struct Message: Identifiable, Equatable {
    let id = UUID()
    let content: String
    let isFromUser: Bool
    let timestamp: Date
}
```

### 2. Mock AI Behavior
Implement a `MockAIService` that:
- Returns different responses based on user input keywords
- Simulates 1-2 second network delay
- Includes at least 5 different response patterns:
  - Greeting detection ("hello", "hi") → friendly greeting
  - Question detection ("?") → helpful response
  - Code-related keywords ("swift", "ios", "app") → technical response
  - Default fallback response
  - Error simulation (random 10% chance of "service unavailable")

### 3. UI Requirements

#### Chat Interface:
- Messages displayed in chronological order
- User messages: blue bubbles, right-aligned
- Assistant messages: gray bubbles, left-aligned
- Timestamp display (optional but bonus points)
- Smooth scrolling behavior

#### Input Area:
- Text field for message input
- Send button (disabled when empty)
- Loading indicator while waiting for AI response
- Clear input field after sending

#### Visual Design:
- Clean, modern appearance
- Proper spacing and margins
- Readable typography
- Handle both light/dark mode appearances

### 4. MVVM Implementation

#### ViewModel Responsibilities:
- Manage chat state (messages array)
- Handle user input validation
- Coordinate with MockAIService
- Provide UI state properties (isLoading, etc.)

#### View Responsibilities:
- Display data from ViewModel
- Handle user interactions
- Respond to state changes

### 5. Advanced Challenges (Choose 1-2 if you finish early):
1. **Message Persistence**: Save/load conversations using UserDefaults
2. **Typing Indicators**: Show "Assistant is typing..." with animated dots
3. **Message Reactions**: Add emoji reactions to messages
4. **Search Functionality**: Search through message history
5. **Custom Input**: Add support for multiline messages

## Evaluation Criteria

### Code Quality (40%)
- Clean, readable Swift code
- Proper MVVM separation
- Consistent naming conventions
- Appropriate use of SwiftUI modifiers

### Architecture (30%)
- Proper MVVM implementation
- Clean separation of concerns
- Appropriate use of async/await
- State management best practices

### Functionality (20%)
- All core features working
- Proper error handling
- Smooth user experience
- Mock AI responses working correctly

### UI/UX (10%)
- Polished appearance
- Intuitive user interface
- Proper spacing and layout
- Responsive design

## Submission Guidelines

### What to Submit:
1. Complete Xcode project
2. Brief README.md explaining:
   - How to run the app
   - Key architectural decisions made
   - Any assumptions or trade-offs
   - What you would improve given more time
3. Send me the link to the git repo where the code was pushed (make sure it's public)

### Project Structure:
- Ensure project builds and runs on iOS 16+
- Include any necessary dependencies
- Provide clear, commented code

## Sample Interaction Flow
```
User: "Hello!"
Assistant: "Hi there! I'm your assistant. How can I help you today?"

User: "What's the weather like?"
Assistant: "I'm a simple assistant and can't check real weather, but I hope it's nice where you are! Is there anything else I can help with?"

User: "Tell me about Swift"
Assistant: "Swift is Apple's programming language for iOS development! It's designed to be fast, safe, and expressive. Are you working on an iOS project?"
```


## Notes for Candidates
- Focus on core functionality first, then polish
- Don't worry about pixel-perfect design - clean and functional is better
- Comment your code where architectural decisions aren't obvious
- If you run out of time, document what you would do next
- This simulates real development constraints - prioritize accordingly

**I know you have access to plenty of tools that can help you in completing this assignment. I have access to these same tools and know what output they will produce. Finding help and using documentation of any kind, including AI, is part of the job. Turning in work that’s been done by someone else, including an AI, doesn’t reflect well on one’s abilities as a candidate. Be smart about it!**

