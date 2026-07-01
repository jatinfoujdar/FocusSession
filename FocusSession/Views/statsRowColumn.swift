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
    let record: SessionRecord
    
    
    var body: some View {
        HStack {
            Image(systemName: record.mode.symbol)
                .foregroundStyle(record.mode.color)
                .frame(width: 32)
            
            VStack(alignment: .leading) {
                Text(record.mode.rawValue)
                    .font(.headline)
                Text(record.startTime, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(record.formattedDuration)
                Text("\(record.pointsEarned) pts")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

