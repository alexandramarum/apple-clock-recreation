import SwiftUI

struct ClockTimerView: View {
    @StateObject var vm = ClockTimerViewModel()
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    
    var body: some View {
        VStack {
            // Picker
            HStack {
                HStack{
                    Picker("Hours", selection: $hours) {
                        ForEach(0..<24) {
                            Text("\($0)")
                        }
                        
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                    Text("hours")
                        .padding(-10)
                }
                HStack {
                    Picker("Minutes", selection: $minutes) {
                        ForEach(0..<60) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                    Text("min")
                        .padding(-10)
                }
                HStack {
                    Picker("Seconds", selection: $seconds) {
                        ForEach(0..<60) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                    Text("sec")
                        .padding(-10)
                }
            }
            .padding()
            .background() {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.white)
                    .opacity(0.43)
                    .frame(height: 30)
            }
            
            // Buttons
            HStack {
                Button {
                    if vm.timer.isTiming {
                        vm.timer.isTiming.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 85, height: 85)
                        .foregroundColor(Color.gray.opacity(0.3))
                        .overlay {
                        Text("Cancel")
                                .foregroundColor(vm.timer.isTiming ? .white : .gray)
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
                        Circle()
                            .frame(width: 85, height: 85)
                            .foregroundColor(Color.orange.opacity(0.3))
                            .overlay {
                                Text("Pause  ")
                                    .foregroundColor(.orange)
                            }
                    } else if vm.timer.isTiming && vm.timer.isPaused {
                        Circle()
                            .frame(width: 85, height: 85)
                            .foregroundColor(Color.green.opacity(0.3))
                            .overlay {
                                Text("Resume")
                                    .foregroundColor(.green)
                            }
                    } else {
                        Circle()
                            .frame(width: 85, height: 85)
                            .foregroundColor(Color.green.opacity(0.3))
                            .overlay {
                                Text("Start")
                                    .foregroundColor(.green)
                            }
                    }
                }
            }
            .padding()
            
            // Controls
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
            
           // Recents
        }
    }
}

struct ClockTimerView_Previews: PreviewProvider {
    static var previews: some View {
        ClockTimerView()
    }
}
