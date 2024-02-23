//
//  TimerViewModel.swift
//  AppleClock
//
//  Created by Alexandra Marum on 12/3/23.
//

import Foundation
import SwiftUI

class ClockTimerViewModel: ObservableObject {
    @Published var timer = clockTimer(isTiming: false, isPaused: false)
}
