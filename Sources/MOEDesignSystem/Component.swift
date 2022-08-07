import SwiftUI

public struct AppButton: View {
    public let text: String
    public let style: Font.TextStyle
    public let action: () -> Void
    public init(_ text: String, style: Font.TextStyle = .body, action: @escaping () -> Void) {
        self.text = text
        self.style = style
        self.action = action
    }
    public var body: some View {
        Button(text, action: action)
            .modifier(DefaultFont(style: style))
    }
}

public struct CustomButton<Content>: View where Content: View {
    public let action: () -> Void
    public let label: () -> Content
    public init(@ViewBuilder label: @escaping () -> Content, action: @escaping () -> Void) {
        self.action = action
        self.label = label
    }
    public var body: some View {
        Button(action: action, label: label)
    }
}

public struct ImageButton: View {
    public let systemName: String
    public let scale: Image.Scale
    public let action: () -> Void
    public init(systemName: String, scale: Image.Scale = .large, action: @escaping () -> Void) {
        self.systemName = systemName
        self.scale = scale
        self.action = action
    }
    public var body: some View {
        Button(
            action: action,
            label: {
                Image(systemName: systemName).imageScale(scale)
            }
        )
    }
}

public struct HorizontalLeadingView<LeadingView>: View where LeadingView: View {
    public let leadingView: LeadingView
    public var body: some View {
        HStack {
            leadingView
            Spacer()
        }
    }
}

public struct HorizontalTrailingView<TrailingView>: View where TrailingView: View {
    public let trailingView: TrailingView
    public var body: some View {
        HStack {
            Spacer()
            trailingView
        }
    }
}

public struct HorizontalLeadingTrailingView<LeadingView, TrailingView>: View
where LeadingView: View, TrailingView: View {
    public let leadingView: LeadingView
    public let trailingView: TrailingView
    public init(
        leading leadingView: LeadingView,
        trailing trailingView: TrailingView) {
            self.leadingView = leadingView
            self.trailingView = trailingView
        }
    public var body: some View {
        HStack {
            leadingView
            Spacer()
            trailingView
        }
    }
}
