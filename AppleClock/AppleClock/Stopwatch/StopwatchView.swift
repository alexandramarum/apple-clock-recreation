// StopwatchView.swift
import SwiftUI

struct StopwatchView: View {
    @StateObject var vmLap = LapViewModel()
    @StateObject var vmStopwatch = StopwatchViewModel()
    
    var body: some View {
        VStack {
            Text("\(vmLap.getTime(elapsedTime: vmLap.elapsedTime))")
                .font(.custom("", size: 50, relativeTo: .body))
                .fontDesign(.rounded)
                .padding()
                .padding()
            
            HStack {
                Button {
                    if vmLap.isPaused {
                        vmStopwatch.clearAll()
                        vmLap.clearAll()
                    } else {
                        vmStopwatch.addLap(lap: Lap(number: vmStopwatch.number + 1, time: vmLap.getTime(elapsedTime: vmLap.lapElapsedTime)))
                        vmLap.clearLap()
                        vmLap.startLapTimer()
                    }
                } label: {
                    if vmLap.isPaused {
                        Text("Reset")
                            .foregroundColor(.white)
                            .background(
                                Circle()
                                    .frame(width: 85, height: 85)
                                    .foregroundColor(Color.gray.opacity(0.3))
                            )
                            .padding()
                    } else {
                        Text("Lap   ")
                            .foregroundColor(.white)
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
                    vmLap.togglePause()
                } label: {
                    if vmLap.isPaused {
                        Text("Start")
                            .foregroundColor(.green)
                            .background(
                                Circle()
                                    .frame(width: 85, height: 85)
                                    .foregroundColor(Color.green.opacity(0.3))
                            )
                            .padding()
                    } else {
                        Text("Stop")
                            .foregroundColor(.red)
                            .background(
                                Circle()
                                    .frame(width: 85, height: 85)
                                    .foregroundColor(Color.red.opacity(0.3))
                            )
                            .padding()
                    }
                }
            }
            .padding()
            .padding()
            
            Divider()
            
            ScrollView {
                ForEach(vmStopwatch.laps.reversed(), id: \.id) { lap in
                    LapView(lap: lap, color: vmStopwatch.getLapColor(thisLap: lap))
                }
            }
        }
        .padding()
        .preferredColorScheme(.dark)
        .accentColor(.orange)
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
