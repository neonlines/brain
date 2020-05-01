import XCTest
@testable import Brain

final class PositionTests: XCTestCase {
    func testEmptySmall() {
        let brain = Brain(borders: .init(radius: 50), wheel: .init(delta: 0))
        XCTAssertEqual(.zero, brain.position(.init()))
    }
    
    func testEmptyBig() {
        let brain = Brain(borders: .init(radius: 1000), wheel: .init(delta: 0))
        let position = brain.position(.init())
        XCTAssertGreaterThanOrEqual(position.x, brain.borders.min)
        XCTAssertGreaterThanOrEqual(position.y, brain.borders.min)
        XCTAssertLessThanOrEqual(position.x, brain.borders.max)
        XCTAssertLessThanOrEqual(position.y, brain.borders.max)
    }
    
    func testSequence() {
        let brain = Brain(borders: .init(radius: 3000), wheel: .init(delta: 0))
        var positions = [CGPoint]()
        (0 ..< 5).forEach { _ in
            let position = brain.position(positions)
            positions.forEach {
                XCTAssertGreaterThanOrEqual(abs($0.x - position.x), brain.borders.spacing)
                XCTAssertGreaterThanOrEqual(abs($0.y - position.y), brain.borders.spacing)
            }
            positions.append(position)
        }
    }
}
