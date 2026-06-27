//
//  ProfileView.swift
//  FocusSession
//
//  Created by jatin foujdar on 24/06/26.
//

import SwiftUI

struct ProfileView: View {
    @State private var username = "Jatin"
    var body: some View {
        NavigationStack{
            List{
                Section(){
                    HStack{
                        Spacer()
                        VStack{
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 80))
                                .foregroundStyle(.blue)
                            
                            TextField("Username", text: $username)
                                .textFieldStyle(.roundedBorder)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        
                    }
                    .padding(.vertical)
                }
                
                Section("Statistics"){
                    StatRow(title: "Total Points", value: "42")
                    StatRow(title: "Total Badges", value: "15")
                    StatRow(title: "Sessions Completed", value: "8")
                }
                
                Section("Recent Sessions") {
                    SessionRow(
                        mode: .work,
                        duration: "45:00",
                        points: 22,
                        startTime: Date()
                    )
                    
                    SessionRow(
                        mode: .play,
                        duration: "30:00",
                        points: 15,
                        startTime: Date().addingTimeInterval(-3600)
                    )
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
