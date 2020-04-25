import Foundation

public final class Brain {
    let borders: Borders
    
    public init(_ borders: Borders) {
        self.borders = borders
    }
    
    public func position(_ lines: [CGPoint]) -> CGPoint {
        { point in
            lines.contains { abs(point.x - $0.x) < borders.spacing || abs(point.y - $0.y) < borders.spacing } ? position(lines) : point
        } (.init(x: randomPoint(), y: randomPoint()))
    }
    
    private func randomPoint() -> CGFloat {
        .random(in: borders.min ... borders.max)
    }
}
