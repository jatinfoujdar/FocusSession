//
//  SessionRecord.swift
//  FocusSession
//
//  Created by jatin foujdar on 01/07/26.
//

// SessionRecord.swift
import Foundation
import SwiftData

@Model
class SessionRecord {
    var id: UUID
    var modeRawValue: String
    var startTime: Date
    var endTime: Date
    var durationSeconds: Int
    var pointsEarned: Int
    
    @Relationship(deleteRule: .cascade) var badges: [BadgeModel]?
    
    // Computed property
    var mode: FocusMode {
        FocusMode(rawValue: modeRawValue) ?? .work
    }
    
    // MARK: - Init with direct assignment
    init(session: FocusSessionModel, badges: [Badge]) {
        self.id = session.id
        self.modeRawValue = session.modeRawValue
        self.startTime = session.startTime
        self.endTime = session.endTime ?? Date()
        self.durationSeconds = session.durationInSeconds
        self.pointsEarned = session.pointsEarned
        self.badges = badges.map { BadgeModel(from: $0) }
    }
    
    // MARK: - Default init (required by SwiftData)
    // SwiftData needs this for fetching from database
    init(
        id: UUID = UUID(),
        modeRawValue: String,
        startTime: Date,
        endTime: Date,
        durationSeconds: Int,
        pointsEarned: Int,
        badges: [BadgeModel]? = nil
    ) {
        self.id = id
        self.modeRawValue = modeRawValue
        self.startTime = startTime
        self.endTime = endTime
        self.durationSeconds = durationSeconds
        self.pointsEarned = pointsEarned
        self.badges = badges
    }
    
    var formattedDuration: String {
        let hours = durationSeconds / 3600
        let minutes = (durationSeconds % 3600) / 60
        let seconds = durationSeconds % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
