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
                LazyVGrid(columns: [GridItem(.flexible()),
                                    GridItem(.flexible())
                                   ], spacing: 16){
                    ForEach(FocusMode.allCases){mode in
                        FocusModeCardView(mode: mode)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
