//
//  BadgeCategory.swift
//  FocusSession
//
//  Created by jatin foujdar on 25/06/26.
//


// Badge.swift
import Foundation

enum BadgeCategory: String, CaseIterable {
    case trees = "Trees"
    case leaves = "Leaves & Fungi"
    case animals = "Animals"
    
    var symbols: [String] {
        switch self {
        case .trees:
            return ["tree", "tree.fill", "cedar", "palm.tree"]
        case .leaves:
            return ["leaf", "leaf.fill", "leaf.arrow.triangle.circlepath", "laurel.leading"]
        case .animals:
            return ["bird", "bird.fill", "tortoise", "tortoise.fill"]
        }
    }
}

struct Badge: Identifiable, Hashable {
    let id: UUID
    let category: BadgeCategory
    let symbol: String
    let pointNumber: Int 
}
