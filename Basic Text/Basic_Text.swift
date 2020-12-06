//
//  Basic_Text.swift
//  Basic Text
//
//  Created by João Gabriel Pozzobon dos Santos on 04/12/20.
//

import WidgetKit
import SwiftUI
import IrregularGradient

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> Basic_TextEntry {
        let settings = UserSettings()
        return Basic_TextEntry(date: Date(), text: "Default text", colorScheme: settings.colorSchemes[0])
    }

    func getSnapshot(in context: Context, completion: @escaping (Basic_TextEntry) -> ()) {
        let settings = UserSettings()
        let entry = Basic_TextEntry(date: Date(), text: settings.text, colorScheme: settings.colorSchemes[settings.currentScheme])
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let settings = UserSettings()
        
        let entries: [Basic_TextEntry] = [Basic_TextEntry(date: Date(), text: settings.text, colorScheme: settings.colorSchemes[settings.currentScheme])]

        let timeline = Timeline(entries: entries, policy: .after(Date().addingTimeInterval(60*60)))
        completion(timeline)
    }
}
 
struct Basic_TextEntry: TimelineEntry {
    var date: Date
    var text: String
    var colorScheme: ColorScheme
}

struct Basic_TextEntryView : View {
    var entry: Basic_TextEntry

    var body: some View {
        ZStack {
            IrregularGradientView(colors: entry.colorScheme.colors, backgroundColor: entry.colorScheme.backgroundColor, animate: .constant(false))
            Text(entry.text)
                .font(Font.title.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

@main
struct Basic_Text: Widget {
    let kind: String = "Basic_Text"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Basic_TextEntryView(entry: entry)
        }
        .configurationDisplayName("Basic Text")
        .description("Displays a basic text label.")
    }
}

struct Basic_Text_Previews: PreviewProvider {
    static var previews: some View {
        Basic_TextEntryView(entry: Basic_TextEntry(date: Date(), text: "Default text", colorScheme: ColorScheme(colors: [], backgroundColor: .black)))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
