//
//  statsRowColumn.swift
//  FocusSession
//
//  Created by jatin foujdar on 24/06/26.
//

import SwiftUI

struct StatRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
        }
    }
}

struct SessionRow: View {
    let mode: FocusMode
    let duration: String
    let points: Int
    let startTime: Date
    
    var body: some View {
        HStack {
            Image(systemName: mode.symbol)
                .foregroundStyle(mode.color)
                .frame(width: 32)
            
            VStack(alignment: .leading) {
                Text(mode.rawValue)
                    .font(.headline)
                Text(startTime, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(duration)
                Text("\(points) pts")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

