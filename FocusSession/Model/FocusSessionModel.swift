//
//  FocusSessionModel.swift
//  FocusSession
//
//  Created by jatin foujdar on 27/06/26.
//

import Foundation
import SwiftData


@Model
class FocusSessionModel {
    var id: UUID
       var modeRawValue: String
       var startTime: Date
       var endTime: Date?
       var pointsEarned: Int
       
       
       var mode: FocusMode {
           FocusMode(rawValue: modeRawValue) ?? .work
       }
    
    init(mode: FocusMode, startTime: Date){
        self.id = UUID()
        self.modeRawValue = mode.rawValue
        self.startTime = startTime
        self.endTime = nil
        self.pointsEarned = 0
    }
    var durationInSeconds: Int {
          let end = endTime ?? Date()
          return Int(end.timeIntervalSince(startTime))
      }
      
      var isActive: Bool {
          endTime == nil
      }
}
