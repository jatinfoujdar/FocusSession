//
//  ActiveSessionView.swift
//  FocusSession
//
//  Created by jatin foujdar on 23/06/26.
//

import SwiftUI
import Combine

struct ActiveSessionView: View {
    
    @State private var currentTime = Date()
    let session: FocusSession
       
       var elapsedSeconds: Int {
           Int(Date().timeIntervalSince(session.startTime))
       }
    
    var formattedTime: String{
        let hours = elapsedSeconds / 3600
        let minutes = (elapsedSeconds % 3600) / 60
        let seconds = elapsedSeconds % 60
        
        
        var hasCrossedHour: Bool { hours > 0 }
        
        if hasCrossedHour {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }

        
        var pointsEarned: Int { elapsedSeconds / 120 }
        
        var body: some View {
            VStack(spacing: 12){
                HStack{
                    Image(systemName: session.mode.symbol)
                    Text("Currently Focusing")
                    Spacer()
                }
                .foregroundStyle(session.mode.color)
                .font(.subheadline)
                
                Text(formattedTime)
                    .font(.system(size: 64, weight: .thin, design: .monospaced))
                    .foregroundStyle(.primary)
                
                Text("\(elapsedSeconds / 120) points earned")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(session.mode.color.opacity(0.1))
                    .stroke(session.mode.color.opacity(0.3), lineWidth: 2)
            )
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                currentTime = Date()
            }
        }
    }
    

func activeSessionView(manager: SessionManager) -> some View {
    // Extract sub-expressions to help the type-checker
    let modeSymbol: String = manager.activeSession?.mode.symbol ?? "questionmark.circle"
    let modeColor: Color = manager.activeSession?.mode.color ?? .blue

    return VStack(spacing: 20) {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: modeSymbol)
                Text("Currently Focusing")
                Spacer()
            }
            .foregroundStyle(modeColor)
            .font(.subheadline)

            Text(manager.formattedTime)
                .font(.system(size: 64, weight: .thin, design: .monospaced))

            Text("\(manager.pointsEarned) points earned")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .padding()
        // Break up background shape composition into distinct modifiers
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(modeColor.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(modeColor.opacity(0.3), lineWidth: 2)
        )

        Button(action: { manager.stopSession() }) {
            Label("Stop Focusing", systemImage: "stop.circle.fill")
                .font(.title2)
        }
        .buttonStyle(.borderedProminent)
        .tint(.red)
    }
}
