//
//  WorldClockViewModel.swift
//  AppleClock
//
//  Created by Alexandra Marum on 11/30/23.
//

import Foundation
import SwiftUI

@MainActor
class WorldClockViewModel: ObservableObject {
    @Published var worldClocks: [WorldClock]
    @Published var locationArray: [String] = []
    @Published var urlString = "https://worldtimeapi.org/api/timezone"

    init() {
        self.worldClocks = []
    }
    
    // TODO: Find out if should be in service???
    // Network call retrieves and decodes JSON from timezone API
    func getData() async {
        // Create URL object w/ desired endpoint url
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            return
        }
        
        do {
            // Retrieve JSON data??
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode JSON data into a list of Strings
            guard let returned = try? JSONDecoder().decode([String].self, from: data) else {
                print("JSON ERROR: Could not decode returned JSON data \(urlString)")
                return
            }
            // Load list of decoded location strings into LocationArray
            self.locationArray = returned
        } catch {
            print("ERROR: Could not use URL at \(urlString) to get data and response")
            return
        }
    }
    
    //TODO: Split into add func and reformat func so same code can be used for both World Clock view and Timezone view
    // Reformat given location string and appends to world clock list. What is displayed in World Clock view
    func addWorldClock(location: String) {
        //TODO: Reformat strings further. Remove all slashes. City and Country only
        if let slash = location.firstIndex(of: "/") {
            var city = String(location[location.index(after: slash)...])
            city = city.replacingOccurrences(of: "_", with: " ")
            // Do not allow replicant world clocks
            for clock in worldClocks {
                if clock.city == city {
                    print("Timezone already exists in world clock!")
                    return
                }
            }
            worldClocks.append(WorldClock(id: UUID(), city: city, timeZone: TimeZone.init(identifier: location) ?? TimeZone.current))
        } else {
            print("ERROR: Location does not contain '/'")
        }
    }
}

