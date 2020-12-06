//
//  ContentView.swift
//  Basic Text Widget
//
//  Created by João Gabriel Pozzobon dos Santos on 04/12/20.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Widget text")) {
                    TextField("Widget text", text: $settings.text, onCommit: {
                        WidgetCenter.shared.reloadAllTimelines()
                    }).padding(5)
                }
                
                Section(header: Text("Color scheme")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach (0..<settings.colorSchemes.count) { index in
                                ColorSchemeSelector(index: index)
                            }
                        }.padding(10)
                    }.listRowInsets(EdgeInsets())
                }
            }.listStyle(InsetListStyle())
            .navigationTitle("Basic Text Widget")
        }
    }
}

struct ColorSchemeSelector: View {
    @EnvironmentObject var settings: UserSettings
    
    let index: Int
    var colorScheme: ColorScheme {
        settings.colorSchemes[index]
    }
    
    @Environment(\.colorScheme) var systemScheme
    
    var body: some View {
        Circle()
            .fill(LinearGradient(gradient: Gradient(colors: colorScheme.colors), startPoint: .topLeading, endPoint: .bottom))
            .frame(width: 50, height: 50)
            .overlay(Circle()
                    .scale(0.8)
                        .stroke(Color(systemScheme == .dark ? .systemGray4 : .white), lineWidth: index == settings.currentScheme ? 3 : 0)
                    .animation(.easeInOut(duration: 0.2)))
            .onTapGesture {
                settings.currentScheme = index
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
                WidgetCenter.shared.reloadAllTimelines()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
