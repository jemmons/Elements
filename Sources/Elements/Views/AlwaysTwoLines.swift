import SwiftUI



public struct AlwaysTwoLines: View {
    private let text: String
    private let alignment: Alignment
    
    
    public init(text someText: String, alignment anAlignment: Alignment = .topLeading) {
        text = someText
        alignment = anAlignment
    }
    
    
    public var body: some View {
        Text(" \n ") // The nbsp is needed to prevent the line from compressing
            .frame(maxWidth: .infinity)
            .lineLimit(2)
            .overlay(Text(text), alignment: alignment)
    }
}



#if DEBUG
struct AlwaysTwoLines_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlwaysTwoLines(text: "Welcome!\nWe\'ve got your first day of practice covered right here.")
            AlwaysTwoLines(text: "Small")
                .previewDisplayName("Short")
            AlwaysTwoLines(text: "Whether we wanted it or not, we’ve stepped into a war with the Cabal on Mars. So let’s get to taking out their command, one by one. Valus Ta’aurc. From what I can gather he commands the Siege Dancers from an imperial land tank outside of Rubicon. He’s well protected, but with the right team, we can punch through those defenses, take this beast out, and break their grip on Freehold.")
                .previewDisplayName("Long")
            AlwaysTwoLines(text: "Small")
                .font(.title)
                .previewDisplayName("Short Title")
            AlwaysTwoLines(text: "Whether we wanted it or not, we’ve stepped into a war with the Cabal on Mars. So let’s get to taking out their command, one by one. Valus Ta’aurc. From what I can gather he commands the Siege Dancers from an imperial land tank outside of Rubicon. He’s well protected, but with the right team, we can punch through those defenses, take this beast out, and break their grip on Freehold.")
                .font(.title)
                .previewDisplayName("Long Title")
        }
        .previewLayout(.fixed(width: 400, height: 300))
    }
}
#endif

