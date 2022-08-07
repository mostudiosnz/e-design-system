import SwiftUI

public enum AppText {
    case string(String)
    case attributed(AttributedString)
    case localized(LocalizedStringKey, StaticString? = nil)
    case localizedFormatted(String, [CVarArg])
    
    private func createView() -> Text {
        switch self {
        case .string(let string):
            return Text(string)
        case .attributed(let attributedString):
            return Text(attributedString)
        case .localized(let key, let comment):
            return Text(key, comment: comment)
        case .localizedFormatted(let key, let args):
            let keyString = String(localized: String.LocalizationValue(key))
            let string = String(format: keyString, arguments: args)
            return Text(string)
        }
    }
    
    public struct LargeTitle: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .largeTitle))
        }
    }
    
    public struct Title: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(attributedString: AttributedString) {
            self.text = .attributed(attributedString)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .title))
        }
    }
    
    public struct Title2: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(attributedString: AttributedString) {
            self.text = .attributed(attributedString)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .title2))
        }
    }
    
    public struct Title3: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(attributedString: AttributedString) {
            self.text = .attributed(attributedString)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .title3))
        }
    }
    
    public struct Headline: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(attributedString: AttributedString) {
            self.text = .attributed(attributedString)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .headline))
        }
    }
    
    public struct Subheadline: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(attributedString: AttributedString) {
            self.text = .attributed(attributedString)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .subheadline))
        }
    }
    
    public struct Body: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(attributedString: AttributedString) {
            self.text = .attributed(attributedString)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .body))
        }
    }
    
    public struct Callout: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(attributedString: AttributedString) {
            self.text = .attributed(attributedString)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .callout))
        }
    }
    
    public struct Caption: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(attributedString: AttributedString) {
            self.text = .attributed(attributedString)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .caption))
        }
    }

    public struct Caption2: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(attributedString: AttributedString) {
            self.text = .attributed(attributedString)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .caption2))
        }
    }

    public struct Footnote: View {
        let text: AppText
        public init(_ text: String) {
            self.text = .string(text)
        }
        public init(attributedString: AttributedString) {
            self.text = .attributed(attributedString)
        }
        public init(key: String, comment: StaticString? = nil) {
            self.text = .localized(LocalizedStringKey(key), comment)
        }
        public init(key: String, args: CVarArg...) {
            self.text = .localizedFormatted(key, args)
        }
        public var body: some View {
            text
                .createView()
                .modifier(DefaultFont(style: .footnote))
        }
    }
}
