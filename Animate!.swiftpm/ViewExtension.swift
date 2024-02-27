import SwiftUI

// .if Modifier for View

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

// Conditional VStack / HStack, if the window width < 550, it will be VStack, otherwise HStack

struct VHStack<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geoSize in
            if geoSize.size.width < 550 {
                VStack {
                    content
                }
            } else {
                HStack {
                    content
                }
            }
        }
    }
}

struct animationTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
    }
}

struct animationDetailStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.secondary)
    }
}
