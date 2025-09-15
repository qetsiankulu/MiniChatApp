import Foundation

struct ChatSession {
    var messages: [Message] = []
    
    mutating func addMessage(_ message: Message) {
        messages.append(message)
    }
    
    mutating func clearMessages() {
        messages.removeAll()
    }
}