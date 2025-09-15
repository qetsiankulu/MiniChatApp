import SwiftUI

struct MessageBubbleView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromUser {
                userBubble()
            } else {
                assistantBubble()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 2)
    }
    
    // MARK: - User message bubble
    @ViewBuilder
    private func userBubble() -> some View {
        Spacer() // Push to the right
        Text(message.content)
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .frame(maxWidth: 250, alignment: .trailing)
    }
    
    // MARK: - Assistant message bubble
    @ViewBuilder
    private func assistantBubble() -> some View {
        Text(message.content)
            .padding(10)
            .background(Color.gray.opacity(0.2))
            .foregroundColor(.primary)
            .cornerRadius(12)
            .frame(maxWidth: 250, alignment: .leading)
        Spacer() // Push to the left
    }
}

#if DEBUG
struct MessageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            MessageBubbleView(message: Message(content: "Hello there!", isFromUser: true))
            MessageBubbleView(message: Message(content: "Hi! How can I help you today?", isFromUser: false))
            MessageBubbleView(message: Message(content: "This is a longer message to test how the bubble handles multiple lines of text content.", isFromUser: true))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
