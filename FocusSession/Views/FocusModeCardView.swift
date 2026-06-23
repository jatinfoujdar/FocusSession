//
//  FocusModeCard.swift
//  FocusSession
//
//  Created by jatin foujdar on 23/06/26.
//

import SwiftUI

struct FocusModeCardView: View {
    let title: String
    let subtitle: String
    let symbol: String
    let color: Color
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(color)
            
            Text(title)
                .font(.headline)
            
            Text(subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(16)
    }
}

#Preview {
    FocusModeCardView(title: "WorkMode", subtitle: "Stay productive", symbol: "briefcase.fill", color: .blue)
}
