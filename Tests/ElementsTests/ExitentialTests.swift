import Testing
import Elements
import SwiftUI





@Test("Public enough to be accessible outside library")
@MainActor func isAccessible() {
    var view: (any View)? = AllSpace()
    view = ConfirmableSheet(title: "foo") { _ in EmptyView() } onConfirm: {}
    view = BrickLayout() {}
    
    #expect(view != nil)
}
