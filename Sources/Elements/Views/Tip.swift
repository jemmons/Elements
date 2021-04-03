import SwiftUI
import AppKit



public struct Tip: View {
  public enum Severity {
    case info, warning, danger
  }
  
  private let severity: Severity
  private let text: String?
  @State private var presented: Bool = false
  
  
  public init(severity aSeverity: Severity = .info, text someText: String? = nil) {
    severity = aSeverity
    text = someText
  }
  
  
  public var body: some View {
    if let someText = text {
      imageView
        .onTapGesture { presented = true }
        .popover(isPresented: $presented) {
          Text(someText)
            .padding()
        }
    } else {
      imageView
    }
  }
  
  
  @ViewBuilder private var imageView: some View {
    switch severity {
    case .info:
      Image(systemName: "info.circle.fill")
        .foregroundColor(.blue)
    case .warning:
      Image(systemName: "questionmark.diamond.fill")
        .foregroundColor(.yellow)
    case .danger:
      Image(systemName: "exclamationmark.octagon.fill")
        .foregroundColor(.red)
    }
  }
}



#if DEBUG
struct Tip_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HStack {
        Tip(severity: .info)
        Tip(severity: .warning)
        Tip(severity: .danger)
      }.padding()
      HStack {
        Tip(severity: .info)
        Tip(severity: .warning)
        Tip(severity: .danger)
      }.padding()
      .background(Color.white)
      HStack {
        Tip(severity: .info)
        Tip(severity: .warning)
        Tip(severity: .danger)
      }.preferredColorScheme(.dark).padding()
    }
  }
}
#endif

