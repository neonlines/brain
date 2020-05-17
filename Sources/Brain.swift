import CoreGraphics

public final class Brain {
    let borders: Borders
    let wheel: Wheel
    
    public init(borders: Borders, wheel: Wheel) {
        self.borders = borders
        self.wheel = wheel
    }
    
    public func position(_ lines: [CGPoint], retry: Int = 300) -> CGPoint? {
        { point in
            lines.contains { abs(point.x - $0.x) < borders.spacing || abs(point.y - $0.y) < borders.spacing }
                ? retry > 0 ? position(lines, retry: retry - 1) : nil
                : point
        } (.init(x: randomPoint(), y: randomPoint()))
    }
    
    public func orient(_ position: CGPoint, current: CGFloat, player: CGPoint) -> CGFloat {
        [current, current - wheel.delta, current + wheel.delta].map(caping).map {
            ($0, pointing(position, bearing: $0, player: player))
        }.sorted { abs($0.1) < abs($1.1) }.first!.0
    }
    
    private func caping(_ radians: CGFloat) -> CGFloat {
        radians > .pi
            ? radians - (2 * .pi)
            : radians < -.pi
                ? radians + (2 * .pi)
                : radians
    }
    
    private func randomPoint() -> CGFloat {
        .random(in: borders.min ... borders.max)
    }
    
    private func pointing(_ point: CGPoint, bearing: CGFloat, player: CGPoint) -> CGFloat {
        caping(atan2(player.x - point.x, player.y - point.y) - bearing)
    }
}
