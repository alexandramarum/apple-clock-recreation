//
//  LapView.swift
//  AppleClock
//
//  Created by Alexandra Marum on 12/2/23.
//

import Foundation
import SwiftUI

struct LapView: View {
    @StateObject var vm = StopwatchViewModel()
    var lap: Lap
    var color: Color
    
    var body: some View {
        VStack{
            HStack (alignment: .bottom){
                Text("Lap \(lap.number)")
                    .fontDesign(.rounded)
                    .foregroundColor(color)
                Spacer()
                Text("\(lap.time)")
                    .fontDesign(.rounded)
                    .foregroundColor(color)
            }
            Divider()
        }
        .preferredColorScheme(.dark)
        .accentColor(.orange)
    }
    
}
