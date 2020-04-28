import XCTest
@testable import Brain

final class RotationTests: XCTestCase {
    
    /*
     up: 0
     down: pi
     right: pi / 2
     left: pi / -2
     */
    
    func testAvoidBorders() {
        let brain = Brain(.init(radius: 200))
        XCTAssertGreaterThan(brain.orient(.init(x: 1, y: 1), current: 0, players: []), 0)
        XCTAssertLessThan(brain.orient(.init(x: 1, y: 1), current: .pi / -2, players: []), .pi / -2)
    }
}
