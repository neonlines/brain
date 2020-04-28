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
        brain = .init(borders: .init(radius: 100), wheel: .init(delta: .pi / 2, speed: 1))
    }
    
    func testAvoidBorders() {
        XCTAssertEqual(.pi / 2, brain.orient(.init(x: -98, y: 98), current: 0, players: []))
        XCTAssertEqual(.pi, abs(brain.orient(.init(x: -98, y: 98), current: .pi / -2, players: [])))
        XCTAssertEqual(.pi / 2, brain.orient(.init(x: -98, y: 98), current: .pi / 2, players: []))
        XCTAssertEqual(.pi, brain.orient(.init(x: -98, y: 98), current: .pi, players: []))
        
        XCTAssertEqual(.pi / -2, brain.orient(.init(x: 98, y: 98), current: 0, players: []))
        XCTAssertEqual(.pi / -2, brain.orient(.init(x: 98, y: 98), current: .pi / -2, players: []))
        XCTAssertEqual(.pi, abs(brain.orient(.init(x: 98, y: 98), current: .pi / 2, players: [])))
        XCTAssertEqual(.pi, brain.orient(.init(x: 98, y: 98), current: .pi, players: []))
        
        XCTAssertEqual(0, brain.orient(.init(x: -98, y: -98), current: 0, players: []))
        XCTAssertEqual(0, brain.orient(.init(x: -98, y: -98), current: .pi / -2, players: []))
        XCTAssertEqual(.pi / 2, brain.orient(.init(x: -98, y: -98), current: .pi / 2, players: []))
        XCTAssertEqual(.pi / 2, brain.orient(.init(x: -98, y: -98), current: .pi, players: []))
        
        XCTAssertEqual(0, brain.orient(.init(x: 98, y: -98), current: 0, players: []))
        XCTAssertEqual(.pi / -2, brain.orient(.init(x: 98, y: -98), current: .pi / -2, players: []))
        XCTAssertEqual(0, brain.orient(.init(x: 98, y: -98), current: .pi / 2, players: []))
        XCTAssertEqual(.pi * 1.5, brain.orient(.init(x: 98, y: -98), current: .pi, players: []))
    }
}
