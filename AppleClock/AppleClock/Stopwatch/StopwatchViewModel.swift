//
//  StopwatchViewModel.swift
//  AppleClock
//
//  Created by Alexandra Marum on 12/2/23.
//

import Foundation
import SwiftUI

class StopwatchViewModel: ObservableObject{
    @Published var laps: [Lap] = []
    @Published var number: Int = 0
    
    func addLap(lap: Lap) {
        laps.append(lap)
        number += 1
    }
    
    func clearAll() {
        laps.removeAll()
        number = 0
    }
    
    func isSlowest(thisLap: Lap) -> Bool {
        for lap in laps {
            if thisLap.time < lap.time {
                return false
            }
        }
        return true
    }
    
    func isFastest(thisLap: Lap) -> Bool {
        for lap in laps {
            if thisLap.time > lap.time {
                return false
            }
        }
        return true
    }
    
    func getLapColor(thisLap: Lap) -> Color {
        while laps.count > 2 {
            if isFastest(thisLap: thisLap) {
                return .green
            } else if isSlowest(thisLap: thisLap) {
                return .red
            } else {
                return .white
            }
        }
        return .white
    }
}
