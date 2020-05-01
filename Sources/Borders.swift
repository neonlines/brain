import CoreGraphics

public struct Borders {
    let min: CGFloat
    let max: CGFloat
    let radius: CGFloat
    let spacing = CGFloat(50)
    
    public init(radius: CGFloat) {
        max = radius - spacing
        min = -max
        self.radius = radius
    }
}
