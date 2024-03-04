//
//  Models.swift
//  AppleClock
//
//  Created by Alexandra Marum on 11/30/23.
//

import Foundation
import SwiftUI

struct WorldClock: Identifiable {
    let id: UUID
    let city: String
    let timeZone: TimeZone
    var currentTime: String {
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.timeStyle = .short
        return formatter.string(from: Date())
    }
}

struct Alarm: Identifiable {
    var id: UUID
    let date: Date
    let time: String
    let label: String
    var isEnabled: Bool
}

struct Lap {
    var id = UUID()
    let number: Int
    let time: String
}

struct clockTimer {
    var id = UUID()
    var isTiming: Bool
    var isPaused: Bool
}
