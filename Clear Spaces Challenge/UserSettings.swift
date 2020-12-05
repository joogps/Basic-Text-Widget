//
//  UserSettings.swift
//  Clear Spaces Challenge
//
//  Created by João Gabriel Pozzobon dos Santos on 05/12/20.
//

import SwiftUI

class UserSettings: ObservableObject {
    let defaults = UserDefaults(suiteName: "group.com.joogps.Clear-Spaces-Challenge")
    
    let colorSchemes = [ColorScheme(colors: [.yellow, .orange, .pink], backgroundColor: .orange), ColorScheme(colors: [.green, Color(.cyan), .blue], backgroundColor: .blue), ColorScheme(colors: [.blue, .purple, .pink], backgroundColor: .purple)]
    
    @Published var text: String {
        didSet {
            defaults!.set(text, forKey: "text")
        }
    }
    
    @Published var currentScheme: Int {
        didSet {
            defaults!.set(currentScheme, forKey: "currentScheme")
        }
    }
    
    init() {
        self.text = defaults!.string(forKey: "text") ?? "Default text"
        self.currentScheme = defaults!.integer(forKey: "currentScheme")
    }
}

struct ColorScheme {
    var colors: [Color]
    var backgroundColor: Color
}
