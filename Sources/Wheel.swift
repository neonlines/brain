import CoreGraphics

public struct Wheel {
    let uncertainty: Int
    let delta: CGFloat
    
    public init(uncertainty: Int, delta: CGFloat) {
        self.uncertainty = uncertainty
        self.delta = delta
    }
}
