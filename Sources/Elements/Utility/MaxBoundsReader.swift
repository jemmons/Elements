import SwiftUI


/**
 This is most useful if applied to the `.background` of a `View`. Then the property can be observed to set other views to equal width/height/both.
 
 See: [This post by Wooji Juice](  https://www.wooji-juice.com/blog/stupid-swiftui-tricks-equal-sizes.html)
 */
public struct MaxBoundsReader: View {
  public struct PrefKey: PreferenceKey {
    public static var defaultValue: CGSize = .zero
    public static func reduce(value: inout CGSize, nextValue: ()->CGSize) {
      let next = nextValue()
      value.width = max(value.width, next.width)
      value.height = max(value.width, next.width)
    }
  }
  
  
  public var body: some View {
    GeometryReader { proxy in
      Color.clear
        .anchorPreference(key: PrefKey.self, value: .bounds) { anchor in
          proxy[anchor].size
        }
    }
  }
}
