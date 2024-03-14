//
//  TimezoneView.swift
//  AppleClock
//
//  Created by Alexandra Marum on 3/14/24.
//

import SwiftUI

// Sheet view - searchable list of API-retrieved timezone locations
struct TimezoneView: View {
    @ObservedObject var vm: WorldClockViewModel
    @State private var searchText: String = ""
    @Binding var isShowingSheet: Bool

    var body: some View {
        NavigationStack {
            List(searchResults, id: \.self) { location in
                HStack {
                    Button {
                        // Every location/search result is a button that can be appended to the vm list of world clocks
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
                // Retrieve data from timezone API in seperate thread
                await vm.getData()
            }
            .listStyle(.plain)
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [String] {
        // List of all locations filtered by search. vm.locationArray loaded from API
        return searchText.isEmpty ? vm.locationArray : vm.locationArray.filter { $0.contains(searchText) }
    }
}
