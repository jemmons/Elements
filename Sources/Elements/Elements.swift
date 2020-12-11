import SwiftUI
import Axioms


public struct Graduation: Shape {
  let divisions: Int
  let subdivisions: Int

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
    Graduation(divisions: 20, subdivisions: 5)
      .stroke(lineWidth: 1.0)
  }
}


