import Foundation

public final class Brain {
    let borders: Borders
    let wheel: Wheel
    
    public init(borders: Borders, wheel: Wheel) {
        self.borders = borders
        self.wheel = wheel
    }
    
    public func position(_ lines: [CGPoint]) -> CGPoint {
        { point in
            lines.contains { abs(point.x - $0.x) < borders.spacing || abs(point.y - $0.y) < borders.spacing } ? position(lines) : point
        } (.init(x: randomPoint(), y: randomPoint()))
    }
    
    public func orient(_ position: CGPoint, current: CGFloat, players: [CGPoint]) -> CGFloat {
        
        /*
         let dx = sin(zRotation)
         let dy = cos(zRotation)
         */
        
        var path = CGMutablePath()
        
        return .pi
        
    }
    
    private func randomPoint() -> CGFloat {
        .random(in: borders.min ... borders.max)
    }
    
    
}
