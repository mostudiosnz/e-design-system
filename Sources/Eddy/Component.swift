import SwiftUI

public struct AppButton: View {
    let text: String
    let style: Font.TextStyle
    let role: ButtonRole?
    let action: () -> Void
    public init(
        _ text: String,
        style: Font.TextStyle = .body,
        role: ButtonRole? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.role = role
        self.action = action
    }
    public var body: some View {
        Button(text, role: role, action: action)
            .modifier(DefaultFont(style: style))
    }
}

public struct CustomButton<Content>: View where Content: View {
    let role: ButtonRole?
    let action: () -> Void
    let label: Content
    public init(
        role: ButtonRole? = nil,
        @ViewBuilder label labelBuilder: () -> Content,
        action: @escaping () -> Void
    ) {
        self.role = role
        self.action = action
        self.label = labelBuilder()
    }
    public var body: some View {
        Button(role: role, action: action, label: { label })
    }
}

public struct ImageButton: View {
    let systemName: String
    let role: ButtonRole?
    let scale: Image.Scale
    let action: () -> Void
    public init(systemName: String, role: ButtonRole? = nil, scale: Image.Scale = .large, action: @escaping () -> Void) {
        self.systemName = systemName
        self.role = role
        self.scale = scale
        self.action = action
    }
    public var body: some View {
        Button(
            role: role,
            action: action,
            label: {
                Image(systemName: systemName).imageScale(scale)
            }
        )
    }
}

public struct HorizontalLeadingView<LeadingView>: View where LeadingView: View {
    let alignment: VerticalAlignment
    let spacing: CGFloat
    let leadingView: LeadingView
    public init(
        alignment: VerticalAlignment = .center,
        spacing: CGFloat = 0,
        @ViewBuilder leading leadingBuilder: () -> LeadingView
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.leadingView = leadingBuilder()
    }
    public var body: some View {
        HStack(spacing: spacing) {
            leadingView
            Spacer()
        }
    }
}

public struct HorizontalTrailingView<TrailingView>: View where TrailingView: View {
    let alignment: VerticalAlignment
    let spacing: CGFloat
    let trailingView: TrailingView
    public init(
        alignment: VerticalAlignment = .center,
        spacing: CGFloat = 0,
        @ViewBuilder trailing trailingBuilder: () -> TrailingView
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.trailingView = trailingBuilder()
    }
    public var body: some View {
        HStack(alignment: alignment, spacing: spacing) {
            Spacer()
            trailingView
        }
    }
}

public struct HorizontalLeadingTrailingView<LeadingView, TrailingView>: View
where LeadingView: View, TrailingView: View {
    let alignment: VerticalAlignment
    let spacing: CGFloat
    let leadingView: LeadingView
    let trailingView: TrailingView
    public init(
        alignment: VerticalAlignment = .center,
        spacing: CGFloat = 0,
        @ViewBuilder leading leadingBuilder: () -> LeadingView,
        @ViewBuilder trailing trailingBuilder: () -> TrailingView
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.leadingView = leadingBuilder()
        self.trailingView = trailingBuilder()
    }
    public var body: some View {
        HStack(alignment: alignment, spacing: spacing) {
            leadingView
            Spacer()
            trailingView
        }
    }
}

public typealias SectionText = AppText.Subheadline

public struct AppSection<Content>: View where Content: View {
    let content: Content
    public init(@ViewBuilder content contentBuilder: () -> Content) {
        self.content = contentBuilder()
    }
    public var body: some View {
        Section(content: { content })
    }
}

public struct AppHeaderSection<Content>: View where Content: View {
    let header: SectionText
    let content: Content
    public init(
        key: String,
        @ViewBuilder content contentBuilder: () -> Content
    ) {
        self.header = AppText.Subheadline(key: key)
        self.content = contentBuilder()
    }
    public init(
        _ text: String,
        @ViewBuilder content contentBuilder: () -> Content
    ) {
        self.header = AppText.Subheadline(text)
        self.content = contentBuilder()
    }
    public var body: some View {
        Section(content: { content }, header: { header })
    }
}

public struct AppFooterSection<Content>: View where Content: View {
    let footer: SectionText
    let content: Content
    public init(
        key: String,
        @ViewBuilder content contentBuilder: () -> Content
    ) {
        self.footer = AppText.Subheadline(key: key)
        self.content = contentBuilder()
    }
    public init(
        _ text: String,
        @ViewBuilder content contentBuilder: () -> Content
    ) {
        self.footer = AppText.Subheadline(text)
        self.content = contentBuilder()
    }
    public var body: some View {
        Section(content: { content }, footer: { footer })
    }
}

public struct AppHeaderFooterSection<Content>: View where Content: View {
    let header: SectionText
    let footer: SectionText
    let content: Content
    public init(
        headerKey: String,
        footerKey: String,
        @ViewBuilder content contentBuilder: () -> Content
    ) {
        self.header = AppText.Subheadline(key: headerKey)
        self.footer = AppText.Subheadline(key: footerKey)
        self.content = contentBuilder()
    }
    public init(
        headerText: String,
        footerText: String,
        @ViewBuilder content contentBuilder: () -> Content
    ) {
        self.header = AppText.Subheadline(headerText)
        self.footer = AppText.Subheadline(footerText)
        self.content = contentBuilder()
    }
    public var body: some View {
        Section(content: { content }, header: { header }, footer: { footer })
    }
}
