//
//  ContentView.swift
//  FocusSession
//
//  Created by jatin foujdar on 23/06/26.
//

// ContentView.swift
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    // Create the session manager as state
    @State private var sessionManager: SessionManager?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                headerView
                
                if let manager = sessionManager {
                    if manager.activeSession != nil {
                        activeSessionView(manager: manager)
                    } else {
                        modeGridView(manager: manager)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
        }
        .onAppear {
            if sessionManager == nil {
                sessionManager = SessionManager(modelContext: modelContext)
            }
        }
    }
    
    // MARK: - Subviews
    
    var headerView: some View {
        HStack {
            Text("Focus Sessions")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            NavigationLink(destination: ProfileView()) {
                Image(systemName: "person.circle")
                    .font(.title2)
            }
        }
    }
    

    
    func modeGridView(manager: SessionManager) -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(FocusMode.allCases) { mode in
                Button(action: { manager.startSession(mode: mode) }) {
                    FocusModeCardView(mode: mode)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    ContentView()
}
