import SwiftUI



extension Binding {
  public func orConstant<Unwrapped>(_ constant: Unwrapped) -> Binding<Unwrapped> where Value == Unwrapped? {
    Binding<Unwrapped> {
      wrappedValue ?? constant
    } set: {
      guard wrappedValue != nil else {
        return
      }
      wrappedValue = $0
    }
  }
}
