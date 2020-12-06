//
//  Basic_Text_WidgetApp.swift
//  Basic Text Widget
//
//  Created by João Gabriel Pozzobon dos Santos on 04/12/20.
//

import SwiftUI

@main
struct Basic_Text_WidgetApp: App {
    var settings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settings)
        }
    }
}
