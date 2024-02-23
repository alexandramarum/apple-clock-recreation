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
}
