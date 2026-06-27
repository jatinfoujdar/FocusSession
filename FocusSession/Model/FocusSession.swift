//
//  FocusSession.swift
//  FocusSession
//
//  Created by jatin foujdar on 23/06/26.
//

import SwiftUI


struct FocusSession: Identifiable {
    let id = UUID()
    let mode: FocusMode
    let startTime: Date
}

