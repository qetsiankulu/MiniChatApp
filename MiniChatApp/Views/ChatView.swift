import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            if viewModel.messages.isEmpty {
                emptyStateView()
            } else {
                messagesListView()
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
    
    // MARK: - Empty State View
     @ViewBuilder
     private func emptyStateView() -> some View {
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
     }
     
     // MARK: - Messages List View
     @ViewBuilder
     private func messagesListView() -> some View {
         ScrollViewReader { proxy in
             ScrollView {
                 LazyVStack(spacing: 8) {
                     ForEach(viewModel.messages) { message in
                         MessageBubbleView(message: message)
                             .id(message.id)
                     }
                 }
                 .padding(.vertical)
             }
             .onChange(of: viewModel.messages.count) { _ in
                 if let lastMessage = viewModel.messages.last {
                     withAnimation {
                         proxy.scrollTo(lastMessage.id, anchor: .bottom)
                     }
                 }
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
