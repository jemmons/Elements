import SwiftUI
import Axioms


public struct Graduation: Shape {
  private let divisions: Int
  private let subdivisions: Int
  
  
  public init(divisions someDivisions: Int, subdivisions someSubdivisions: Int) {
    divisions = someDivisions
    subdivisions = someSubdivisions
  }
  
  
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    // Axis
    path.move(to: [rect.minX, rect.midY])
    path.addLine(to: [rect.maxX, rect.midY])
    
    let divisionCount = divisions * (subdivisions+1)
    for i in 0...divisionCount {
      let isSubdivision = !(i.isMultiple(of: subdivisions))
      path.move(to: [
        rect.width/CGFloat(divisionCount) * CGFloat(i),
        rect.midY - (isSubdivision ? 5 : 10)
      ])
      path.addLine(to: [
        rect.width/CGFloat(divisionCount) * CGFloat(i),
        rect.midY + (isSubdivision ? 5 : 10)
      ])
    }
    return path
  }
}



public struct Graduation_Preview: PreviewProvider {
  public static var previews: some View {
    Group {
      Graduation(divisions: 15, subdivisions: 1)
        .stroke(lineWidth: 1.0)
      Graduation(divisions: 15, subdivisions: 2)
        .stroke(lineWidth: 1.0)
      Graduation(divisions: 15, subdivisions: 3)
        .stroke(lineWidth: 1.0)
      Graduation(divisions: 15, subdivisions: 5)
        .stroke(lineWidth: 1.0)
    }
    .previewLayout(.fixed(width: 400, height: 100))
  }
}


