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
        [current, current - wheel.delta, current + wheel.delta].map { ($0, borderSteps(position, bearing: $0)) }.max { $0.1 < $1.1 }!.0
    }
    
    private func randomPoint() -> CGFloat {
        .random(in: borders.min ... borders.max)
    }
    
    private func borderSteps(_ point: CGPoint, bearing: CGFloat) -> Int {
        var distance = borderDistance(point)
        guard distance > wheel.speed else { return 0 }
        
        var newPoint = move(point, bearing: bearing)
        var newDistance = borderDistance(newPoint)
        guard newDistance < distance else { return .max }
        
        var steps = 0
        while newDistance > wheel.speed && newDistance < distance {
            steps += 1
            distance = newDistance
            newPoint = move(newPoint, bearing: bearing)
            newDistance = borderDistance(newPoint)
        }
        return steps
    }
    
    private func move(_ point: CGPoint, bearing: CGFloat) -> CGPoint {
        let dx = sin(bearing)
        let dy = cos(bearing)
        let speedY = (1 - abs(dx)) * wheel.speed
        let speedX = wheel.speed - speedY
        return .init(x: point.x + (dx * speedX), y: point.y + (dy * speedY))
    }
    
    private func borderDistance(_ point: CGPoint) -> CGFloat {
        min(abs(borders.radius - abs(point.x)), abs(borders.radius - abs(point.y)))
    }
}
