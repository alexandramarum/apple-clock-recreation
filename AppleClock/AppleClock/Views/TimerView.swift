import SwiftUI

struct ClockTimerView: View {
    @StateObject var vm = ClockTimerViewModel()
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Picker("Hours", selection: $hours) {
                    ForEach(0..<24) {
                        Text("\($0)hrs")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                
                Picker("Minutes", selection: $minutes) {
                    ForEach(0..<60) {
                        Text("\($0)min")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                
                Picker("Seconds", selection: $seconds) {
                    ForEach(0..<60) {
                        Text("\($0)sec")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
            }
            .padding()
            
            HStack{
                Button {
                    if vm.timer.isTiming {
                        vm.timer.isTiming.toggle()
                    }
                } label: {
                    if vm.timer.isTiming {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .background(
                                Circle()
                                    .frame(width: 85, height: 85)
                                    .foregroundColor(Color.gray.opacity(0.3))
                            )
                            .padding()
                    } else {
                        Text("Cancel")
                            .foregroundColor(.gray)
                            .background(
                                Circle()
                                    .frame(width: 85, height: 85)
                                    .foregroundColor(Color.gray.opacity(0.3))
                            )
                            .padding()
                    }
                }
                
                Spacer()
                
                Button {
                    if vm.timer.isTiming {
                        vm.timer.isPaused.toggle()
                    } else {
                        vm.timer.isTiming.toggle()
                    }
                } label: {
                    if vm.timer.isTiming && !vm.timer.isPaused {
                        Text("Pause  ")
                            .foregroundColor(.orange)
                            .background(
                                Circle()
                                    .frame(width: 85, height: 85)
                                    .foregroundColor(Color.orange.opacity(0.3))
                            )
                            .padding()
                    } else if vm.timer.isTiming && vm.timer.isPaused {
                        Text("Resume")
                            .foregroundColor(.green)
                            .background(
                                Circle()
                                    .frame(width: 85, height: 85)
                                    .foregroundColor(Color.green.opacity(0.3))
                            )
                            .padding()
                    } else {
                        Text("Start")
                            .foregroundColor(.green)
                            .background(
                                Circle()
                                    .frame(width: 85, height: 85)
                                    .foregroundColor(Color.green.opacity(0.3))
                            )
                            .padding()
                    }
                    
                }
            }
            .padding()
            
            List {
                HStack {
                    Text("When Timer Ends")
                    Spacer()
                    Text("Radar")
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .preferredColorScheme(.dark)
            .accentColor(.orange)
            
            Spacer()
        }
    }
}

struct ClockTimerView_Previews: PreviewProvider {
    static var previews: some View {
        ClockTimerView()
    }
}
