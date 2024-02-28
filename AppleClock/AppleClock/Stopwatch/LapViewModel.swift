import Foundation
import SwiftUI

class LapViewModel: ObservableObject {
    @Published var startDate = Date()
    @Published var elapsedTime: Double = 0.0
    @Published var isPaused = true
    @Published var timer = Timer()

    @Published var lapStartTime = Date()
    @Published var lapElapsedTime: Double = 0.0
    @Published var lapTimer = Timer()

    init() {
        startTimer()
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if !self.isPaused {
                self.elapsedTime = Double(Date().timeIntervalSince(self.startDate))
            }
        }
    }

    func startLapTimer() {
        lapTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if !self.isPaused {
                self.lapElapsedTime = Double(Date().timeIntervalSince(self.lapStartTime))
            }
        }
    }

    func togglePause() {
        if isPaused {
            startDate = Date().addingTimeInterval(-elapsedTime)
            lapStartTime = Date().addingTimeInterval(-lapElapsedTime)
        }
        isPaused.toggle()
        if !isPaused {
            startLapTimer()
        }
    }

    func clearAll() {
        elapsedTime = 0.0
        lapElapsedTime = 0.0
    }

    func clearLap() {
        lapStartTime = Date()
        lapElapsedTime = 0.0
    }
}
