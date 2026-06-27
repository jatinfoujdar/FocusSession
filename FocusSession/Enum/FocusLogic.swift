//
//  FocusLogic.swift
//  FocusSession
//
//  Created by jatin foujdar on 27/06/26.
//

// FocusLogic.swift
import Foundation

enum FocusLogic {
    /// Calculate points from elapsed seconds
    /// 1 point every 2 minutes (120 seconds)
    static func points(from elapsedSeconds: Int) -> Int {
        elapsedSeconds / 120
    }
    
    /// Calculate elapsed seconds between two dates
    static func elapsedSeconds(from startTime: Date, to endTime: Date) -> Int {
        Int(endTime.timeIntervalSince(startTime))
    }
    
    /// Generate a deterministic badge for a given point number
    /// Uses a seeded random number generator so the same point always gets the same badge
    static func badge(for pointNumber: Int) -> Badge {
        // Create a deterministic seed from the point number
        var seededGenerator = SeededRandomGenerator(seed: UInt64(pointNumber))
        
        // Pick a random category
        let categories = BadgeCategory.allCases
        let categoryIndex = Int.random(in: 0..<categories.count, using: &seededGenerator)
        let category = categories[categoryIndex]
        
        // Pick a random symbol from that category
        let symbolIndex = Int.random(in: 0..<category.symbols.count, using: &seededGenerator)
        let symbol = category.symbols[symbolIndex]
        
        return Badge(
            id: UUID(),
            category: category,
            symbol: symbol,
            pointNumber: pointNumber
        )
    }
    
    /// Generate all badges up to a given point count
    static func badges(upTo pointCount: Int) -> [Badge] {
        (1...pointCount).map { badge(for: $0) }
    }
}

// MARK: - Seeded Random Generator

/// A random number generator that produces the same sequence for the same seed
struct SeededRandomGenerator: RandomNumberGenerator {
    private var state: UInt64
    
    init(seed: UInt64) {
        self.state = seed
    }
    
    mutating func next() -> UInt64 {
        // Simple LCG (Linear Congruential Generator) for deterministic randomness
        state = 6364136223846793005 &* state &+ 1442695040888963407
        return state
    }
}
