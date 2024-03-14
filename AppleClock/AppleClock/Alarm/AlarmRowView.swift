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
    @State var isShowingSheet: Bool = false
    
    var body: some View {
        Button {
            isShowingSheet.toggle()
        } label: {
            HStack {
                if vm.alarmState == .edit {
                    Image(systemName: "circle.fill")
                        .foregroundColor(.red)
                        .font(.title3)
                        .overlay {
                            Image(systemName: "minus")
                                .font(.subheadline)
                        }
                        .padding(.trailing)
                }
                VStack {
                    HStack {
                        VStack {
                            HStack(alignment: .bottom) {
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
                                if vm.alarmState == .edit {
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.secondary)
                                } else {
                                    Toggle("", isOn: $alarm.isEnabled)
                                        .onChange(of: alarm.isEnabled) { _ in
                                            if alarm.isEnabled {
                                                textColor = .white
                                            } else {
                                                textColor = .secondary
                                            }
                                        }
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
            .animation(.spring(), value: vm.alarmState)
        }
        .sheet(isPresented: $isShowingSheet) {
            SheetView(isShowingSheet: $isShowingSheet, vm: vm, sheetVm: SheetViewModel(date: alarm.date, label: alarm.label, state: .edit, alarm: alarm))
        }
    }
    
    struct AlarmRowView_Previews: PreviewProvider {
        static var previews: some View {
            let alarm = Binding.constant(Alarm(id: UUID(), date: Date.now, time: "12:31 AM", label: "Test Test Test Test Test TestTestTestTestTestT Test Test Test Test Test Test", isEnabled: false))
            return AlarmRowView(vm: AlarmViewModel(), alarm: alarm)
        }
    }
}
