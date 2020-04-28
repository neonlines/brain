import CoreGraphics

public struct Wheel {
    let delta: CGFloat
    let speed: CGFloat
    
    public init(delta: CGFloat, speed: CGFloat) {
        self.delta = delta
        self.speed = speed
    }
}
