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
        let trimmed = currentInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }  // Ensure the user has typed something meaningdful, if input is empty, do nothing
        
        // 1. Add user message
        chatSession.addMessage(Message(content: trimmed, isFromUser: true))
        
        // 2. Reset input & error
        currentInput = ""
        errorMessage = nil
        isLoading = true            // Waiting for AI response
        
        // 3. Call AI Service
        Task {
            defer {isLoading = false} // Always reset isLoading whether AI responds OR an error occurs
            
            // Call the AI service asynchronously and wait for its response.
            // Add AI service response to chat session
            do {
                let response = try await aiService.generateResponse(for: trimmed)
                let assistantMessage = Message(content: response, isFromUser: false)
                chatSession.addMessage(assistantMessage)
            } catch {
                errorMessage = "Failed to get response: \(error.localizedDescription)"
            }
            
        }
    }
    
    func clearChat() {
        // TODO: Clear all messages and reset state
        chatSession.clearMessages()
        errorMessage = nil
    }
    
    func clearError() {
        errorMessage = nil
    }

    var canSendMessage: Bool {
        // Return whether message can be sent
        let trimmed = currentInput.trimmingCharacters(in: .whitespacesAndNewlines)
        return !isLoading && !trimmed.isEmpty
    }
    
    var messages: [Message] {
        return chatSession.messages
    }
}
