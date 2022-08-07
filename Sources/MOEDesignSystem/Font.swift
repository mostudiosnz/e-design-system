import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

public struct DefaultFont: ViewModifier {
    public let style: Font.TextStyle
    public func body(content: Content) -> some View {
        content.font(style.defaultFont)
    }
}

public extension Font.TextStyle {
    var defaultFont: Font {
        return Font.custom(name, size: size, relativeTo: self)
    }
}

public extension Font.TextStyle {
    fileprivate var size: CGFloat {
        switch self {
        case .largeTitle: return 34
        case .title: return 28
        case .title2: return 22
        case .title3: return 20
        case .headline: return 17
        case .body: return 17
        case .callout: return 16
        case .subheadline: return 15
        case .footnote: return 13
        case .caption: return 12
        case .caption2: return 11
        @unknown default: return 17
        }
    }
    
    fileprivate var name: String {
        switch self {
        case .largeTitle: return "Avenir Next Heavy"
        case .title, .title2, .title3: return "Avenir Next Bold"
        case .headline: return "Avenir Next Demi Bold"
        case .body, .callout: return "Avenir Next Medium"
        case .subheadline, .caption, .caption2: return "Avenir Next Regular"
        case .footnote: return "Avenir Next Ultra Light"
        @unknown default: return "Avenir Next Medium"
        }
    }
    
#if os(iOS)
    var uiFont: UIFont {
        return UIFont(name: name, size: size)!
    }
#endif
}

public extension Font {
#if os(iOS)
    static func setAppearance() {
        let largeTitleFont = Font.TextStyle.largeTitle.uiFont
        let headlineFont = Font.TextStyle.headline.uiFont
        let captionFont = Font.TextStyle.caption.uiFont
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: largeTitleFont as Any]
        UINavigationBar.appearance().titleTextAttributes = [.font: headlineFont as Any]
        UISegmentedControl.appearance().setTitleTextAttributes([.font: captionFont as Any], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([.font: headlineFont as Any], for: .normal)
    }
#endif
}
