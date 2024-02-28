//
//  LapView.swift
//  AppleClock
//
//  Created by Alexandra Marum on 12/2/23.
//

import Foundation
import SwiftUI

struct LapView: View {
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
    
    struct LapView_Previews: PreviewProvider {
        static var previews: some View {
            LapView(lap: Lap(number: 1, time: 4.000))
        }
    }

}
