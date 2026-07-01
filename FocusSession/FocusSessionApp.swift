//
//  FocusSessionApp.swift
//  FocusSession
//
//  Created by jatin foujdar on 23/06/26.
//

import SwiftData
import SwiftUI

@main
struct FocusSessionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [FocusSessionModel.self, SessionRecord.self, BadgeModel.self, UserProfile.self])
    }
}
