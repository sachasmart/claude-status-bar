import Cocoa

func trafficLightIcon(eff: String, height: CGFloat = 14) -> NSImage {
    let color: NSColor
    switch eff {
    case "permission":       color = .systemRed
    case "thinking", "tool": color = .systemYellow
    default:                 color = .systemGreen
    }
    return NSImage(size: NSSize(width: height, height: height), flipped: false) { rect in
        color.setFill()
        NSBezierPath(ovalIn: rect.insetBy(dx: 0.5, dy: 0.5)).fill()
        return true
    }
}
