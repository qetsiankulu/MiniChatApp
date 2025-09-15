import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // TODO: Implement main chat interface
            // Requirements:
            // 1. ScrollView containing LazyVStack of messages
            // 2. Use ScrollViewReader for auto-scrolling to bottom
            // 3. Display MessageBubbleView for each message
            // 4. Auto-scroll to newest message when new message is added
            // 5. Proper spacing between messages
            // 6. Handle empty state (no messages yet)
            // 7. ChatInputView at the bottom
            //
            // Hints:
            // - Use ScrollViewReader { proxy in ... }
            // - Use LazyVStack for performance with many messages
            // - Give each message an id for scrolling: .id(message.id)
            // - Use proxy.scrollTo(lastMessageId) in .onChange()
            // - Consider .onChange(of: viewModel.messages.count) for auto-scroll
            // - Use withAnimation for smooth scrolling
            
            if viewModel.messages.isEmpty {
                // Empty state
                VStack {
                    Spacer()
                    Image(systemName: "bubble.left.and.bubble.right")
                        .font(.system(size: 60))
                        .foregroundColor(.gray.opacity(0.6))
                    Text("No messages yet")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    Text("Start a conversation!")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            } else {
                // Messages list
                ScrollView {
                    LazyVStack(spacing: 4) {
                        ForEach(viewModel.messages) { message in
                            MessageBubbleView(message: message)
                        }
                    }
                    .padding(.top)
                }
            }
            
            Divider()
            
            ChatInputView(viewModel: viewModel)
        }
        .navigationTitle("Chat Assistant")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Clear") {
                    viewModel.clearChat()
                }
                .disabled(viewModel.messages.isEmpty)
            }
        }
    }
}

#if DEBUG
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView()
        }
    }
}
#endif