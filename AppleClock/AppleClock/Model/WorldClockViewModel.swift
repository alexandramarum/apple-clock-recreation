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
    
    func getData() async {
        print("We are accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let returned = try? JSONDecoder().decode([String].self, from: data) else {
                print("JSON ERROR: Could not decode returned JSON data \(urlString)")
                return
            }
            self.locationArray = returned
        } catch {
            print("ERROR: Could not use URL at \(urlString) to get data and response")
            return
        }
    }
    
    func addWorldClock(location: String) {
        if let slash = location.firstIndex(of: "/") {
            var city = String(location[location.index(after: slash)...])
            city = city.replacingOccurrences(of: "_", with: " ")
            worldClocks.append(WorldClock(id: UUID(), city: city, timeZone: TimeZone.init(identifier: location) ?? TimeZone.current))
        } else {
            print("ERROR: Location does not contain '/'")
        }
    }
}

