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
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("Add Alarm")
                    .bold()
                Spacer()
                Button {
                    isShowingSheet.toggle()
                    vm.addAlarm(time: sheetVm.time, label: sheetVm.label)
                } label: {
                    Text("Save")
                        .bold()
                }
            }
            .padding()

            Spacer()

            HStack {
                DatePicker("",selection: $sheetVm.selectedTime, displayedComponents: [.hourAndMinute])
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
