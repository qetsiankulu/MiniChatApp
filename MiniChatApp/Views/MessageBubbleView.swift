import SwiftUI

struct MessageBubbleView: View {
    let message: Message
    
    var body: some View {
        // TODO: Implement message bubble UI
        // Requirements:
        // 1. Display message content
        // 2. Different styling for user vs assistant messages:
        //    - User: blue background, white text, trailing alignment
        //    - Assistant: gray background, primary text, leading alignment
        // 3. Proper bubble shape with rounded corners
        // 4. Appropriate padding inside bubbles
        // 5. Proper alignment within parent (HStack with Spacer())
        // 6. Optional: Display timestamp
        //
        // Hints:
        // - Use HStack with Spacer() for alignment
        // - Use .background() modifier with RoundedRectangle
        // - Consider Color.blue vs Color.gray for backgrounds
        // - Use .foregroundColor() for text color
        // - message.isFromUser determines styling
        
        HStack {
            Text("TODO: Implement message bubble")
                .padding()
                .background(Color.gray)
                .cornerRadius(12)
        }
        .padding(.horizontal)
        .padding(.vertical, 2)
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