//
//  SessionManager.swift
//  FocusSession
//
//  Created by jatin foujdar on 01/07/26.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class SessionManager {
    // Dependencies
    private let modelContext: ModelContext
    
    // State
    private(set) var activeSession: FocusSessionModel?
    private(set) var currentTime: Date = Date()
    private var timer: Timer?
    
    // Computed properties
    var elapsedSeconds: Int {
        guard let session = activeSession else { return 0 }
        return FocusLogic.elapsedSeconds(from: session.startTime, to: currentTime)
    }
    
    var pointsEarned: Int {
        FocusLogic.points(from: elapsedSeconds)
    }
    
    var formattedTime: String {
        let hours = elapsedSeconds / 3600
        let minutes = (elapsedSeconds % 3600) / 60
        let seconds = elapsedSeconds % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    var hasCrossedHour: Bool {
        elapsedSeconds >= 3600
    }
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        restoreActiveSession()
    }
    
    // MARK: - Actions
    
    func startSession(mode: FocusMode) {
        let session = FocusSessionModel(mode: mode, startTime: Date())
        modelContext.insert(session)
        activeSession = session
        startTimer()
    }
    
    func stopSession() {
        guard let session = activeSession else { return }
        
        // Calculate final values
        let finalElapsed = elapsedSeconds
        let finalPoints = FocusLogic.points(from: finalElapsed)
        
        // Update session
        session.endTime = Date()
        session.pointsEarned = finalPoints
        
        // Generate and save badges
        let badges = FocusLogic.badges(upTo: finalPoints)
        let record = SessionRecord(session: session, badges: badges)
        modelContext.insert(record)
        
        // Clean up
        stopTimer()
        activeSession = nil
        
        // Save changes
        try? modelContext.save()
    }
    
    // MARK: - Timer Management
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.currentTime = Date()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - Persistence
    
    private func restoreActiveSession() {
        // Fetch any active session (no end time)
        let descriptor = FetchDescriptor<FocusSessionModel>(
            predicate: #Predicate { $0.endTime == nil }
        )
        
        if let session = try? modelContext.fetch(descriptor).first {
            activeSession = session
            startTimer()
        }
    }
}
