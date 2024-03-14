import Foundation
import SwiftUI

class SheetViewModel: ObservableObject {
    enum state {
        case add
        case edit
    }
    
    @Published var date: Date
    @Published var label: String
    @Published var alarmState: state
    @Published var alarm: Alarm?
    
    var title: String {
        switch alarmState {
        case .add:
            return "Add Alarm"
        case .edit:
            return "Edit Alarm"
        }
    }
    var time: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: date)
    }
    
    init(date: Date, label: String, state: state, alarm: Alarm?) {
        self.date = date
        self.label = label
        self.alarmState = state
        self.alarm = alarm
    }
}
