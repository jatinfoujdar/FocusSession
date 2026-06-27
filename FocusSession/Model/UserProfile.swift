//
//  UserProfile.swift
//  FocusSession
//
//  Created by jatin foujdar on 27/06/26.
//


import Foundation
import SwiftData

@Model
class UserProfile {
    var id: UUID
    var name: String
    var createdAt: Date
    
    init(name: String = "Focus User") {
        self.id = UUID()
        self.name = name
        self.createdAt = Date()
    }
}
