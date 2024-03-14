//
//  WorldClockView.swift
//  AppleClock
//
//  Created by Alexandra Marum on 11/30/23.
//

import Foundation
import SwiftUI

struct WorldClockView: View {
    @StateObject var vm: WorldClockViewModel
    @State var isShowingSheet = false

    var body: some View {
        // Display list of user-chosen timezones
        NavigationStack {
            VStack {
                ScrollView {
                    // Iterate through list of WorldClock objects stored in vm
                    ForEach(vm.worldClocks, id: \.id) { worldClock in
                        // For each clock, construct a row that displays its loc and time
                        WorldClockRow(vm: vm, worldClock: worldClock)
                    }
                } // TODO: Make deletable
            }
            .padding()
            .navigationTitle("World Clock")
            .navigationBarItems(
                leading:
                Button {
                    // TODO: Add/remove delete button to worldclock row on toggle
                } label: {
                    Text("Edit")

                },
                trailing:
                Button {
                    // Trigger sheet view w/ searchable list of timezone locations that can be appended to vm world clocks
                    isShowingSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $isShowingSheet) {
                    // Sheetview displaying list of all appendable timezones
                    TimezoneView(vm: vm, isShowingSheet: $isShowingSheet)
                }
            )
            .preferredColorScheme(.dark)
            .accentColor(.orange)
        }
    }
}

struct WorldClockView_Previews: PreviewProvider {
    static var previews: some View {
        WorldClockView(vm: WorldClockViewModel())
    }
}
