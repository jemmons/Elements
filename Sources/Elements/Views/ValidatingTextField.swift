import SwiftUI
import Axioms



public struct ValidatingTextField: View {
  @Binding private var text: String
  private let placeholder: String
  private let validity: Validity
  
  
  public init(text someText: Binding<String>, placeholder aPlaceholder: String, validity theValidity: Validity) {
    _text = someText
    placeholder = aPlaceholder
    validity = theValidity
  }
  
  
  public var body: some View {
    HStack {
      TextField(placeholder, text: $text)
      switch validity {
      case .valid:
        Tip().hidden()
      case .invalid(let reason):
        Tip(severity: .info, text: reason)
      }
    }
  }
}



#if DEBUG
struct ValidatingTextField_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ValidatingTextField(text:.constant("Text"), placeholder: "foo", validity: .invalid("foo"))

      ValidatingTextField(text:.constant(""), placeholder: "Place Holder", validity: .invalid("foo"))
      

      ValidatingTextField(text:.constant("Text"), placeholder: "Place Holder", validity: .valid)
    }
    .padding()
    .previewLayout(.fixed(width: 300, height: 200))
  }
}
#endif

