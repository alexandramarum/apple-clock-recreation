//
//  AlarmRowView.swift
//  AppleClock
//
//  Created by Alexandra Marum on 12/2/23.
//

import Foundation
import SwiftUI

struct AlarmRowView: View {
    @ObservedObject var vm: AlarmViewModel
    @Binding var alarm: Alarm
    @State var textColor: Color = .secondary

    var body: some View {
        VStack{
            HStack {
                VStack{
                    HStack (alignment: .bottom){
                        Text(vm.getCurrentTime(alarm: alarm))
                            .font(.largeTitle)
                            .padding(-3)
                            .fontDesign(.rounded)
                            .foregroundColor(textColor)
                        Text(vm.getAmOrPm(alarm: alarm))
                            .font(.title2)
                            .fontDesign(.rounded)
                            .foregroundColor(textColor)
                        Spacer()
                        Toggle("", isOn: $alarm.isEnabled)
                            .onChange(of: alarm.isEnabled) { newValue in
                                updateTextColor()
                            }
                    }
                    HStack {
                        if alarm.label.isEmpty {
                            Text("Alarm")
                                .fontDesign(.rounded)
                                .foregroundColor(textColor)
                        } else {
                            Text(alarm.label)
                                .fontDesign(.rounded)
                                .foregroundColor(textColor)
                        }
                        Spacer()
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func updateTextColor() {
        textColor = alarm.isEnabled ? .white : .secondary
    }
}


struct AlarmRowView_Previews: PreviewProvider {
    static var previews: some View {
        let alarm = Binding.constant(Alarm(id: UUID(), date: Date.now, time: "12:31 AM", label: "Test Test Test Test Test TestTestTestTestTestT Test Test Test Test Test Test", isEnabled: false))
        return AlarmRowView(vm: AlarmViewModel(), alarm: alarm)
    }
}
