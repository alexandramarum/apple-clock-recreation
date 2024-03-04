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
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(vm.worldClocks, id: \.id) { worldClock in
                        WorldClockRow(worldClock: worldClock, vm: vm)
                    }
                }
            }
            .padding()
            .navigationTitle("World Clock")
            .navigationBarItems(
                leading:
                Button {} label: {
                    Text("Edit")

                },
                trailing:
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $isShowingSheet) {
                    TimezoneView(vm: vm, isShowingSheet: $isShowingSheet)
                }
            )
            .preferredColorScheme(.dark)
            .accentColor(.orange)
        }
    }
}

struct WorldClockRow: View {
    let worldClock: WorldClock
    let currTime: String

    init(worldClock: WorldClock, vm: WorldClockViewModel) {
        self.worldClock = worldClock
        self.currTime = worldClock.currentTime
    }

    var body: some View {
        Divider()
        HStack(alignment: .bottom) {
            Text(worldClock.city)
                .font(.title)
                .fontDesign(.rounded)
            Spacer()
            Text(currTime)
                .font(.largeTitle)
                .fontDesign(.rounded)
                .padding(-3)
        }
    }
}

struct TimezoneView: View {
    @ObservedObject var vm: WorldClockViewModel
    @State private var searchText: String = ""
    @Binding var isShowingSheet: Bool

    var body: some View {
        NavigationStack {
            List(searchResults, id: \.self) { location in
                HStack {
                    Button {
                        vm.addWorldClock(location: location)
                        isShowingSheet.toggle()
                    } label: {
                        Text(location)
                    }
                    Spacer()
                }
                .padding()
            }
            .task {
                await vm.getData()
            }
            .listStyle(.plain)
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [String] {
        return searchText.isEmpty ? vm.locationArray : vm.locationArray.filter { $0.contains(searchText) }
    }
}

struct WorldClockView_Previews: PreviewProvider {
    static var previews: some View {
        WorldClockView(vm: WorldClockViewModel())
    }
}
