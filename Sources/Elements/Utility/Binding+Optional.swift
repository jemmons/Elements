import SwiftUI



public extension Binding {
    func orConstant<Unwrapped>(_ constant: Unwrapped) -> Binding<Unwrapped>
    where Value == Unwrapped?, Unwrapped: Sendable {
        Binding<Unwrapped> {
            wrappedValue ?? constant
        } set: {
            wrappedValue = $0
        }
    }
}
