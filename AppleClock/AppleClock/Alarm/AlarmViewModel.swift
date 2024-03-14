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
    enum state {
        case working
        case edit
    }
    @Published var alarmState: state = .working
    
    func addAlarm(newAlarm: Alarm) {
        for alarm in alarms {
            if alarm.time == newAlarm.time {
                return
            }
        }
        alarms.append(newAlarm)
        // sorts alarms by date from earliest-latest
        alarms.sort(by: {$0.date < $1.date})
    }
    
    func editAlarm(id: UUID, date: Date, time: String, label: String) {
        for index in alarms.indices {
            if alarms[index].id == id {
                alarms[index] = Alarm(id: id, date: date, time: time, label: label, isEnabled: alarms[index].isEnabled)
            }
        }
        alarms.sort(by: {$0.date < $1.date})
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
