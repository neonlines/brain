import Foundation

public final class Brain {
    let borders: Borders
    
    public init(_ borders: Borders) {
        self.borders = borders
    }
    
    public func position(_ lines: Set<CGPath>) -> CGPoint {
        .zero
    }
}
