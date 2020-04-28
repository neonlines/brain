import XCTest
@testable import Brain

/*
    up: 0
    down: pi
    right: pi / 2
    left: pi / -2
*/

final class RotationTests: XCTestCase {
    private var brain: Brain!
    
    override func setUp() {
        brain = .init(borders: .init(radius: 100), wheel: .init(uncertainty: 0, delta: .pi / 4))
    }
    
    func testAvoidBorders() {
        XCTAssertGreaterThan(brain.orient(.init(x: 1, y: 1), current: 0, players: []), 0)
        XCTAssertLessThan(brain.orient(.init(x: 1, y: 1), current: .pi / -2, players: []), .pi / -2)
    }
}
