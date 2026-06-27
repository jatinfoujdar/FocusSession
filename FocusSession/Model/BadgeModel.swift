//
//  BadgeModel.swift
//  FocusSession
//
//  Created by jatin foujdar on 27/06/26.
//


import Foundation
import SwiftData

@Model
class BadgeModel {
    var id: UUID
    var pointNumber: Int
    var categoryRawValue: String
    var symbol: String
    
    var category: BadgeCategory {
        BadgeCategory(rawValue: categoryRawValue) ?? .trees
    }
    
    init(from badge: Badge) {
        self.id = badge.id
        self.pointNumber = badge.pointNumber
        self.categoryRawValue = badge.category.rawValue
        self.symbol = badge.symbol
    }
}
