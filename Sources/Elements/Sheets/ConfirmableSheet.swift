import SwiftUI



public struct ConfirmableSheet<Content>: View where Content: View {
    private let title: String
    private let onConfirm: () -> Void
    private let isValid: () -> Bool
    @ViewBuilder private let content: (DismissAction) -> Content
    @Environment(\.dismiss) private var dismiss
    
    public init(title: String, content: @escaping (DismissAction) -> Content, onConfirm: @escaping () -> Void, isValid: @escaping () -> Bool = { true }) {
        self.title = title
        self.content = content
        self.isValid = isValid
        self.onConfirm = onConfirm
    }
}



public extension ConfirmableSheet {
    var body: some View {
        NavigationStack {
            content(dismiss)
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button(role: .confirm) {
                            onConfirm()
                            dismiss()
                        }
                        .disabled(!isValid())
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button(role: .cancel) {
                            dismiss()
                        }
                    }
                }
        }
    }
}



#Preview {
    NavigationStack {
        ConfirmableSheet(title: "Do a Thing") { dismiss in
            VStack{
                Text("Use this button to dismiss instead:")
                Button("Dismiss") {
                    dismiss()
                }
            }
        } onConfirm: {
            print("Confirm")
        }
    }
}
