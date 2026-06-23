//
//  ContentView.swift
//  FocusSession
//
//  Created by jatin foujdar on 23/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Focus Sessions")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack(spacing: 16){
                FocusModeCardView(
                    title: "Work", subtitle: "Stay productive", symbol: "briefcase.fill", color: .blue
                )
                
                FocusModeCardView(
                    title: "Play",
                    subtitle: "Have fun",
                    symbol: "gamecontroller.fill",
                    color: .green
                )
            }
                HStack(spacing: 16) {
                    FocusModeCardView(
                        title: "Rest",
                        subtitle: "Recharge",
                        symbol: "leaf.fill",
                        color: .orange
                    )
                    
                    FocusModeCardView(
                        title: "Sleep",
                        subtitle: "Sweet dreams",
                        symbol: "moon.fill",
                        color: .purple
                    )
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
