//
//  LapView.swift
//  AppleClock
//
//  Created by Alexandra Marum on 12/2/23.
//

import Foundation
import SwiftUI

struct LapView: View {
    @ObservedObject var vm = StopwatchViewModel()
    var lap: Lap
    
    var body: some View {
        VStack{
            HStack (alignment: .bottom){
                Text("Lap \(lap.number)")
                    .fontDesign(.rounded)
                Spacer()
                Text("\(lap.time)")
                    .fontDesign(.rounded)
            }
            Divider()
        }
        .preferredColorScheme(.dark)
        .accentColor(.orange)
    }
    
}
