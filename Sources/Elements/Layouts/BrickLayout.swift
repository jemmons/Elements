import SwiftUI



public struct BrickLayout: Layout {
    private let hPad: CGFloat
    private let vPad: CGFloat
    
    
    public init(hPad: CGFloat = 10, vPad: CGFloat = 8) {
        self.hPad = hPad
        self.vPad = vPad
    }
    
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard subviews.count > 0 else {
            return .zero
        }
        
        var proposedSize = proposal.replacingUnspecifiedDimensions()
        
        let bounds = CGRect(origin: .zero, size: proposedSize)
        let bricks = Helper.bricks(from: subviews, in: bounds, hPad: hPad, vPad: vPad)
        proposedSize.height = bricks.reduce(0) { memo, rect in
            return max(memo, rect.maxY)
        }
        
        return proposedSize
    }

    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let bricks = Helper.bricks(from: subviews, in: bounds, hPad: hPad, vPad: vPad)
        for (i, subview) in subviews.enumerated() {
            subview.place(at: bricks[i].origin, proposal: .unspecified)
        }
    }
}



private enum Helper {
    static func bricks(from subviews: Layout.Subviews, in bounds: CGRect, hPad: CGFloat, vPad: CGFloat) -> [CGRect] {
        let RESET_X: CGFloat = bounds.minX
        let RESET_HEIGHT: CGFloat = 0
        var xOffset: CGFloat = RESET_X
        var yOffset: CGFloat = bounds.minY
        var maxHeight: CGFloat = RESET_HEIGHT
        
        return subviews.map { subview in
            let size = subview.sizeThatFits(.unspecified)
            
            if xOffset + size.width > bounds.maxX, xOffset != RESET_X {
                yOffset += maxHeight + vPad
                xOffset = RESET_X
                maxHeight = RESET_HEIGHT
            }
            let brick = CGRect(origin: CGPoint(x: xOffset, y: yOffset), size: size)
            
            xOffset += size.width + vPad
            maxHeight = max(maxHeight, size.height)

            return brick
        }
    }
}



#Preview {
        BrickLayout(hPad: 10, vPad: 8) {
            Group {
                Text("Hello, world!")
                Text("Foo")
                Text("Bar")
                Text("Three Word Thing")
                Text("Baz")
                Text("Quux")
                Text("Xyzzy")
                Text("Thud")
                Text("Three rings for the Elven-kings")
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(.cyan)
            .clipShape(.capsule)
        }
        .padding()
}
