import Foundation

protocol AIServiceProtocol {
    func generateResponse(for userMessage: String) async throws -> String
}

class MockAIService: AIServiceProtocol {
    
    enum AIServiceError: Error {
        case serviceUnavailable
        case invalidInput
    }
    
    func generateResponse(for userMessage: String) async throws -> String {
        // Example responses:
        // - Greetings ("hello", "hi") → "Hi there! How can I help you today?"
        // - Questions (contains "?") → "That's a great question! Let me help you with that."
        // - Code-related ("swift", "ios", "app") → "I'd love to help with iOS development!"
        // - Default → "I'm here to help! What would you like to know?"
        
        
        // 1. Simulate network delay
        try await simulateNetworkDelay()
        
        // 2. Simulate error 10% of the time
        if shouldSimulateError() {
            throw AIServiceError.serviceUnavailable
        }
        
        // 3. Categorize the message
        let category = categorizeMessage(userMessage)
        
        // 4. Return based on category
        switch category {
        case .greeting:
            return  "Hi there! How can I help you today?"
        case .question:
            return "That's a great question! Let me help you with that."
        case .codeRelated:
               return "I'd love to help with iOS development!"
           case .default:
               return "I'm here to help! What would you like to know?"
            
        }
        
        
  
    }
    

    private func simulateNetworkDelay() async throws {
        // Simulate 1-2 second network delay
        // Task.sleep(nanoseconds:) suspends current task for at least the given duration
        // Added `throws` keyword as Task.sleep can throw a CancellationError i.e. we acknowledge the task can get cancelled.
        try await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...2_000_000_000))
    }
    
    private func shouldSimulateError() -> Bool {
        // Return true 10% of the time to simulate service errors
        return Int.random(in: 1...10) == 1
    }
    
    private func categorizeMessage(_ message: String) -> MessageCategory {
        // Categorize user input for appropriate responses
        // Check message.lowercased() for keywords
    
        let lowercased = message.lowercased()
        
        if lowercased.contains("hello") || lowercased.contains("hi") {
             return .greeting
         } else if lowercased.contains("?") {
             return .question
         } else if lowercased.contains("swift") || lowercased.contains("ios") || lowercased.contains("app") {
             return .codeRelated
         } else {
             return .default
         }
    }
    
    private enum MessageCategory {
        case greeting
        case question
        case codeRelated
        case `default`
    }
}
