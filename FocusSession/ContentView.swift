//
//  ContentView.swift
//  FocusSession
//
//  Created by jatin foujdar on 23/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var activeSession: FocusSession? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Focus Sessions")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            if let session = activeSession {
                ActiveSessionView(session : session)
                
                Button(action: stopSession){
                    Label("Stop Focusing", systemImage: "stop.circle.fill")
                        .font(.title2)
                }
                 .buttonStyle(.borderedProminent)
                 .tint(.red)
            }else{
                HStack(spacing: 16){
                    LazyVGrid(columns: [GridItem(.flexible()),
                                        GridItem(.flexible())
                                       ], spacing: 16){
                        ForEach(FocusMode.allCases){mode in
                            FocusModeCardView(mode: mode)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .padding()
    }
    func startSession(mode: FocusMode){
        activeSession = FocusSession(mode: mode, startTime: Date())
    }
    func stopSession(){
        activeSession = nil
    }
}

#Preview {
    ContentView()
}
