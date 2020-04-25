import CoreGraphics

public struct Borders {
    let min: CGFloat
    let max: CGFloat
    let spacing = CGFloat(100)
    
    public init(radius: CGFloat) {
        max = radius - spacing
        min = -max
    }
}
