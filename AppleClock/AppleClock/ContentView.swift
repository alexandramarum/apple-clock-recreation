//
//  ContentView.swift
//  AppleClock
//
//  Created by Alexandra Marum on 11/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WorldClockView(vm: WorldClockViewModel())
                .tabItem {
                    Label("World Clock", systemImage: "globe")
                }
            AlarmView()
                .tabItem {
                    Label("Alarm", systemImage: "alarm")
                }
            StopwatchView()
                .tabItem {
                    Label("Stopwatch", systemImage: "stopwatch")
                }
            ClockTimerView()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
        }
        .preferredColorScheme(.dark)
        .accentColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
