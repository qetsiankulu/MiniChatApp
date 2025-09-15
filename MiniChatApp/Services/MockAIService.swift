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
        // TODO: Implement mock AI logic here
        // Requirements:
        // 1. Simulate 1-2 second delay using Task.sleep()
        // 2. Handle different input patterns (greetings, questions, code-related, default)
        // 3. 10% chance of throwing serviceUnavailable error
        // 4. Return appropriate responses based on user input
        // 
        // Example responses:
        // - Greetings ("hello", "hi") → "Hi there! How can I help you today?"
        // - Questions (contains "?") → "That's a great question! Let me help you with that."
        // - Code-related ("swift", "ios", "app") → "I'd love to help with iOS development!"
        // - Default → "I'm here to help! What would you like to know?"
        
        fatalError("Implement mock AI response logic")
    }
    
    // MARK: - Helper Methods (Optional - you can implement these or create your own approach)
    
    private func simulateNetworkDelay() async {
        // Simulate 1-2 second network delay
        // Hint: Use Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...2_000_000_000))
    }
    
    private func shouldSimulateError() -> Bool {
        // Return true 10% of the time to simulate service errors
        // Hint: Int.random(in: 1...10) == 1
        return false
    }
    
    private func categorizeMessage(_ message: String) -> MessageCategory {
        // Categorize user input for appropriate responses
        // Check message.lowercased() for keywords
        return .default
    }
    
    private enum MessageCategory {
        case greeting
        case question
        case codeRelated
        case `default`
    }
}