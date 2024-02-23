//
//  AlarmViewModel.swift
//  AppleClock
//
//  Created by Alexandra Marum on 12/1/23.
//

import Foundation
import SwiftUI

class AlarmViewModel: ObservableObject {
    @Published var alarms: [Alarm] = []
    
    func addAlarm(time: String, label: String) {
        let alarm = Alarm(id: UUID(), time: time, label: label, isEnabled: false)
        alarms.append(alarm)
    }
    
    func deleteAlarm(index: Int) {
        alarms.remove(at: index)
    }
    
    func toggleAlarm(index: Int) {
        alarms[index].isEnabled.toggle()
    }
    
    func getCurrentTime(alarm: Alarm) -> String {
        let currentTimeArr = alarm.time.components(separatedBy: " ")
        return currentTimeArr[0]
    }
    
    func getAmOrPm(alarm: Alarm) -> String {
        let currentTimeArr = alarm.time.components(separatedBy: " ")
        return currentTimeArr[1]
    }
    
}
