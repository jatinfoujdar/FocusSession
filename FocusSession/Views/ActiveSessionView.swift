//
//  ActiveSessionView.swift
//  FocusSession
//
//  Created by jatin foujdar on 23/06/26.
//

import SwiftUI

struct ActiveSessionView: View {
    let mode: FocusMode
    let elapsedSeconds: Int
    
    var formattedTime: String{
        let hours = elapsedSeconds / 3600
        let minutes = (elapsedSeconds % 3600) / 60
        let seconds = elapsedSeconds % 60
        
    
            if hours > 0 {
                return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
            } else {
                return String(format: "%02d:%02d", minutes, seconds)
                
            }
        }
        
        var pointsEarned: Int { elapsedSeconds / 120 }
        
        var body: some View {
            VStack(spacing: 12){
                HStack{
                    Image(systemName: mode.symbol)
                    Text("Currently Focusing")
                    Spacer()
                }
                .foregroundStyle(mode.color)
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
                    .fill(mode.color.opacity(0.1))
                    .stroke(mode.color.opacity(0.3), lineWidth: 2)
            )
        }
    }



