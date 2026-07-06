import Cocoa

func trafficLightIcon(eff: String, height: CGFloat = 18) -> NSImage {
    let width = ceil(height * 0.6)
    let lit: NSColor
    switch eff {
    case "permission":       lit = .systemRed
    case "thinking", "tool": lit = .systemYellow
    default:                 lit = .systemGreen
    }
    let dark = NSApp.effectiveAppearance.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua
    let housing = (dark ? NSColor.white : NSColor.black).withAlphaComponent(0.20)
    let off = (dark ? NSColor.white : NSColor.black).withAlphaComponent(0.28)

    return NSImage(size: NSSize(width: width, height: height), flipped: false) { rect in
        let housingRect = rect.insetBy(dx: 0.5, dy: 0.5)
        housing.setFill()
        NSBezierPath(roundedRect: housingRect, xRadius: width / 2.6, yRadius: width / 2.6).fill()

        let pad = width * 0.16
        let d = width - pad * 2
        let gap = (height - d * 3) / 4
        let lamps: [(slot: String, y: CGFloat)] = [
            ("permission", height - gap - d),
            ("thinking", (height - d) / 2),
            ("idle", gap),
        ]
        for lamp in lamps {
            let isLit = lamp.slot == eff || (lamp.slot == "thinking" && eff == "tool")
            (isLit ? lit : off).setFill()
            NSBezierPath(ovalIn: NSRect(x: pad, y: lamp.y, width: d, height: d)).fill()
        }
        return true
    }
}
