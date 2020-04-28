import XCTest
@testable import Brain

final class PositionTests: XCTestCase {
    func testEmptySmall() {
        let brain = Brain(.init(radius: 200))
        XCTAssertEqual(.zero, brain.position(.init()))
    }
    
    func testEmptyBig() {
        let brain = Brain(.init(radius: 1000))
        let position = brain.position(.init())
        XCTAssertGreaterThanOrEqual(position.x, brain.borders.min)
        XCTAssertGreaterThanOrEqual(position.y, brain.borders.min)
        XCTAssertLessThanOrEqual(position.x, brain.borders.max)
        XCTAssertLessThanOrEqual(position.y, brain.borders.max)
    }
    
    func testSequence() {
        let brain = Brain(.init(radius: 3000))
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
