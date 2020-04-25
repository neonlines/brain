import XCTest
@testable import Brain

final class PositionTests: XCTestCase {
    func testEmptySmall() {
        let brain = Brain(.init(radius: 100))
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
        
    }
}
