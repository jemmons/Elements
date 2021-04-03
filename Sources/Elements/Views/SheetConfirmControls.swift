import SwiftUI


public struct SheetConfirmControls<ConfirmLabel>: View where ConfirmLabel: View {
  private let minButtonWidth: CGFloat = 60
  private let isDisabled: Bool
  private let shouldDefaultConfirm: Bool
  private let confirmAction: ()->Void
  private let cancelAction: ()->Void
  private let confirmLabel: ConfirmLabel
  
  
  public init(disabled: Bool = false, defaultConfirm: Bool = false, confirmAction aConfirmAction: @escaping ()->Void,
              cancelAction aCancelAction: @escaping ()->Void,
              @ViewBuilder confirmLabel aConfirmLabel: ()->ConfirmLabel) {
    isDisabled = disabled
    shouldDefaultConfirm = defaultConfirm
    confirmAction = aConfirmAction
    cancelAction = aCancelAction
    confirmLabel = aConfirmLabel()
  }
  
  
  public var body: some View {
    VStack {
      Divider()
      HStack(spacing: 10) {
        Spacer()
        Button(action: cancelAction) {
          Text("Cancel")
            .frame(minWidth: minButtonWidth)
        }
        .keyboardShortcut(.cancelAction)
        if shouldDefaultConfirm {
          confirmButton
            .keyboardShortcut(.defaultAction)
        } else {
          confirmButton
        }
      }
      .padding(.top, 5)
      .padding([.leading, .trailing, .bottom])
    }
  }
  
  
  @ViewBuilder private var confirmButton: some View {
    Button(action: confirmAction) {
      confirmLabel
        .frame(minWidth: minButtonWidth)
    }
    .disabled(isDisabled)
    .keyboardShortcut(.defaultAction)
  }
}




#if DEBUG
struct SheetConfirmControls_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SheetConfirmControls {} cancelAction: {} confirmLabel: {
        Text("OK")
      }
      
      SheetConfirmControls(disabled: true) {} cancelAction: {} confirmLabel: {
        Text("OK")
      }
      
      SheetConfirmControls {} cancelAction: {} confirmLabel: {
        Label("Do All the Things", systemImage: "cross")
      }
    }
    .padding()
    .previewLayout(.fixed(width: 500, height: 200))
  }
}
#endif

