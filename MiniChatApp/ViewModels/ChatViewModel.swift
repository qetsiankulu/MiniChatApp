import Foundation
import SwiftUI

@MainActor
class ChatViewModel: ObservableObject {
    @Published var chatSession = ChatSession()
    @Published var currentInput = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let aiService: AIServiceProtocol
    
    init(aiService: AIServiceProtocol = MockAIService()) {
        self.aiService = aiService
    }
    
    func sendMessage() {
        // TODO: Implement message sending logic
        // Requirements:
        // 1. Validate input (non-empty after trimming whitespace)
        // 2. Create user message and add to chat session
        // 3. Clear current input
        // 4. Set loading state to true
        // 5. Use Task {} to call aiService.generateResponse() asynchronously
        // 6. Handle success case: create assistant message and add to chat session
        // 7. Handle error case: set errorMessage
        // 8. Always set loading state to false
        //
        // Hints:
        // - Use currentInput.trimmingCharacters(in: .whitespacesAndNewlines)
        // - Don't forget to clear errorMessage on new attempts
        // - Use do-catch block for async error handling
    }
    
    func clearChat() {
        // TODO: Clear all messages and reset state
        chatSession.clearMessages()
        errorMessage = nil
    }
    
    func clearError() {
        errorMessage = nil
    }
    
    // MARK: - Computed Properties
    var canSendMessage: Bool {
        // TODO: Return whether message can be sent
        // Should return true if:
        // - Not currently loading
        // - Current input is not empty after trimming
        return false
    }
    
    var messages: [Message] {
        return chatSession.messages
    }
}