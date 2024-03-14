//
//  WorldClockRow.swift
//  AppleClock
//
//  Created by Alexandra Marum on 3/14/24.
//

import SwiftUI

// Pass in and display World Clock object
struct WorldClockRow: View {
    @ObservedObject var vm: WorldClockViewModel
    var worldClock: WorldClock
    var currTime: String {
        return worldClock.currentTime
    }
    
    // Display city and current time of world clock
    var body: some View {
        Divider()
        HStack(alignment: .bottom) {
            Text(worldClock.city)
                .font(.title)
                .fontDesign(.rounded)
            Spacer()
            Text(currTime)
                .font(.largeTitle)
                .fontDesign(.rounded)
                .padding(-3)
        }
    }
}
