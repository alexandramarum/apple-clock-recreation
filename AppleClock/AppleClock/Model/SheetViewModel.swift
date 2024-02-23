import Foundation
import SwiftUI

class SheetViewModel: ObservableObject {
    @Published var selectedTime = Date()
    @Published var label = ""

    var time: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: selectedTime)
    }

}
