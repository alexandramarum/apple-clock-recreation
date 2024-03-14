//
//  SheetView.swift
//  AppleClock
//
//  Created by Alexandra Marum on 12/2/23.
//

import Foundation
import SwiftUI

struct SheetView: View {
    @Binding var isShowingSheet: Bool
    @ObservedObject var vm: AlarmViewModel
    @ObservedObject var sheetVm: SheetViewModel

    var body: some View {
        VStack {
            HStack {
                Button {
                    isShowingSheet.toggle()
                    vm.alarmState = .working
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text(sheetVm.title)
                    .bold()
                Spacer()
                Button {
                    isShowingSheet.toggle()
                    vm.alarmState = .working
                    switch sheetVm.alarmState {
                    case .add:
                        vm.addAlarm(newAlarm: Alarm(id: UUID(), date: sheetVm.date, time: sheetVm.time, label: sheetVm.label, isEnabled: false))
                    case .edit:
                        vm.editAlarm(id: sheetVm.alarm!.id, date: sheetVm.date, time: sheetVm.time, label: sheetVm.label)
                    }
                } label: {
                    Text("Save")
                        .bold()
                }
            }
            .padding()

            Spacer()

            HStack {
                DatePicker("",selection: $sheetVm.date, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
            }


            List {
                HStack {
                    Text("Label")
                    Spacer()
                    TextField("Alarm", text: $sheetVm.label)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.secondary)
                }
            }
        }
        .preferredColorScheme(.dark)
        .accentColor(.orange)
    }
}
