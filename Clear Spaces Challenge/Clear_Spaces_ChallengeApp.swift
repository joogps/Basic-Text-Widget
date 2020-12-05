//
//  Clear_Spaces_ChallengeApp.swift
//  Clear Spaces Challenge
//
//  Created by João Gabriel Pozzobon dos Santos on 04/12/20.
//

import SwiftUI

@main
struct Clear_Spaces_ChallengeApp: App {
    var settings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settings)
        }
    }
}
