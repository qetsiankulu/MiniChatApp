import SwiftUI

struct ChatInputView: View {
    @ObservedObject var viewModel: ChatViewModel
    
    var body: some View {
        // TODO: Implement chat input UI
        // Requirements:
        // 1. HStack containing TextField and Send button
        // 2. TextField bound to viewModel.currentInput
        // 3. Send button that calls viewModel.sendMessage()
        // 4. Send button enabled/disabled based on viewModel.canSendMessage
        // 5. Loading indicator (ProgressView) when viewModel.isLoading
        // 6. Submit message on return key press
        // 7. Proper styling and spacing
        //
        // Hints:
        // - Use TextField("Type a message...", text: $viewModel.currentInput)
        // - Use .onSubmit { } modifier for return key handling
        // - Use Button with .disabled() modifier
        // - Consider using SF Symbols for send button icon
        // - Add proper padding and background styling
        
        VStack(spacing: 0) {
            // Error message display
            if let errorMessage = viewModel.errorMessage {
                HStack {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .font(.caption)
                    Spacer()
                    Button("Dismiss") {
                        viewModel.clearError()
                    }
                    .font(.caption)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            
            // Main input area
            HStack {
                TextField("Type a message...", text: $viewModel.currentInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(0.8)
                } else {
                    Button("Send") {
                        // TODO: Call viewModel.sendMessage()
                    }
                    .disabled(!viewModel.canSendMessage)
                }
            }
            .padding()
            .background(Color(UIColor.systemBackground))
        }
    }
}