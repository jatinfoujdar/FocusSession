//
//  FocusMode.swift
//  FocusSession
//
//  Created by jatin foujdar on 23/06/26.
//


import SwiftUI

enum FocusMode: String, CaseIterable, Identifiable {
    case work = "Work"
    case play = "Play"
    case rest = "Rest"
    case sleep = "Sleep"
    
    var id: String { rawValue }
    
    var symbol: String {
        switch self {
        case .work: return "briefcase.fill"
        case .play: return "gamecontroller.fill"
        case .rest: return "leaf.fill"
        case .sleep: return "moon.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .work: return .blue
        case .play: return .green
        case .rest: return .orange
        case .sleep: return .purple
        }
    }
    
    var subtitle: String {
        switch self {
        case .work: return "Stay productive"
        case .play: return "Have fun"
        case .rest: return "Recharge"
        case .sleep: return "Sweet dreams"
        }
    }
}