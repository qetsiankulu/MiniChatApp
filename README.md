# Mini Chat Assistant

**Time Limit: 2 Hours**

## Overview
A simplified chat interface that simulates a conversation with an Mock AI assistant

## Requirements
### Core Features (Must Have)
1. **Chat Interface**: Display messages in a scrollable list
2. **Message Input**: Text field with send button
3. **Mock AI Responses**: Simulate AI responses with predefined logic
4. **Message Types**: Support user and assistant message bubbles with different styling
5. **Auto-scroll**: Automatically scroll to newest messages

### Technical Requirements
- Used **SwiftUI** for all UI components
- Implemented **MVVM pattern** with proper separation of concerns
- Handled basic **error states** (empty messages, etc.)
- Used **async/await** for simulated network delays
- Implement proper **state management**

### ✅ Features Implemented
- [x] **Mock AI Service** – Simulates an AI response system with network delay, random errors, and context-aware replies (greetings, questions, code-related, or default)
- [x] **Chat ViewModel** – Manages chat state, handles user input, communicates asynchronously with the AI service, and updates UI state including loading and error messages
- [x] **iOS Specifications** – Runs on iOS 16+ 

- [x] **ChatInputView** – TextField for user input, Send button enabled/disabled based on `canSendMessage`, submit on return key, loading indicator with `ProgressView`, error message display with dismiss button, proper padding and background styling.

- [x] **ChatView** – Main chat screen with VStack layout:
    - Empty state view when there are no messages.
    - ScrollView + LazyVStack for messages.
    - ScrollViewReader for auto-scrolling to the newest message.
    - Smooth animation for auto-scroll when new messages arrive.
    - ChatInputView pinned at the bottom.
    - Clear button in navigation bar to reset chat.
    
- [x] **MessageBubbleView** – Displays individual messages with:
    - Separate styling for user vs assistant.
    - Rounded corners and padding inside bubbles.
    - Max width for readability.
    - Spacer usage for proper alignment.
    - Refactored into two helper methods: `userBubble()` and `assistantBubble()` for maintainability.
- [x] **Mock AI Service Responses with Emojis** – Added friendly emojis to assistant replies to make interactions more engaging and expressive.

### 🚀 Potential Improvements

- Add more **text animations** for a lively chat experience, such as animated typing dots, smooth message fade-ins  
- Add an **option to search messages** within the chat session for easy reference to previous conversations
- Integrate a **real AI API** (e.g., OpenAI, GPT) to provide dynamic chatbot responses instead of static mock replies.   
- Include **message timestamps** or “read receipts” for a more realistic chat interface.  

