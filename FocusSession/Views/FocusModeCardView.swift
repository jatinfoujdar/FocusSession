//
//  FocusModeCard.swift
//  FocusSession
//
//  Created by jatin foujdar on 23/06/26.
//

import SwiftUI

struct FocusModeCardView: View {
    let mode : FocusMode
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: mode.symbol)
                .font(.largeTitle)
                .foregroundStyle(mode.color)
            
            Text(mode.rawValue)
                .font(.headline)
            
            Text(mode.subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(mode.color.opacity(0.1))
        .cornerRadius(16)
    }
}


