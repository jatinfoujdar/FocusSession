//
//  ProfileView.swift
//  FocusSession
//
//  Created by jatin foujdar on 24/06/26.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @Query(sort: \SessionRecord.startTime, order: .reverse) private var records: [SessionRecord]
    @Query private var profiles : [UserProfile]
    @Environment(\.modelContext) private var modelContext
    
    @State private var username = "Username"
    
    var profile: UserProfile? {
        profiles.first
    }
    
    var totalPoints: Int{
        records.reduce(0){$0 + $1.pointsEarned}
    }
    
    var totalBadges: Int{
        records.compactMap {$0.badges}.flatMap {$0}.count
    }
    
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
                                .onSubmit {
                                    //                                    saveUserName()
                                }
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                }
                
                Section("Statistics"){
                    StatRow(title: "Total Points", value: "\(totalPoints)")
                    StatRow(title: "Total Badges", value: "\(totalBadges)")
                    StatRow(title: "Sessions Completed", value: "\(records.count)")
                }
                
                
                if totalBadges > 0 {
                    Section("Badges"){
                        BadgeGridView(badges: records.compactMap { $0.badges }.flatMap { $0 })
                    }
                }
                
                Section("Recent Sessions") {
                    ForEach(records) { record in
                        SessionRow(record: record)
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct BadgeGridView: View {
    let badges: [BadgeModel]
    
    let columns = [
        GridItem(.adaptive(minimum: 60, maximum: 80))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(badges) { badge in
                VStack(spacing: 8) {
                    ZStack {
                        Circle()
                            .fill(categoryColor(badge.category).opacity(0.15))
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: badge.symbol)
                            .font(.title2)
                            .foregroundStyle(categoryColor(badge.category))
                    }
                    
                    Text("\(badge.pointNumber) pt")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.vertical, 8)
    }
    
    private func categoryColor(_ category: BadgeCategory) -> Color {
        switch category {
        case .trees: return .green
        case .leaves: return .mint
        case .animals: return .orange
        }
    }
}

#Preview {
    ProfileView()
}
