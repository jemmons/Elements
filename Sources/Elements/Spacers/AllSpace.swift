import SwiftUI



public struct AllSpace: View {
    public init() {}
    public var body: some View {
        Color.clear
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}



#Preview {
    VStack {
        Text("pushed wide")
        Text("and to the top")
        AllSpace()
    }
    .border(.red, width: 3)
}
