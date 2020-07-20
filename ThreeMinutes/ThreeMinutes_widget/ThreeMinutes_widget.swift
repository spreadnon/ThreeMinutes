//
//  ThreeMinutes_widget.swift
//  ThreeMinutes_widget
//
//  Created by iOS123 on 2020/7/20.
//  Copyright © 2020 CQL. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    public func snapshot(for configuration: ConfigurationIntent, with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    public func timeline(for configuration: ConfigurationIntent, with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    public let configuration: ConfigurationIntent
    public typealias Entry = SimpleEntry
}

struct PlaceholderView : View {
    var body: some View {
        VStack{
            Image("icon")
            Text("Placeholder View")
        }
        
    }
}

struct ThreeMinutes_widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

@main
struct ThreeMinutes_widget: Widget {
    private let kind: String = "ThreeMinutes_widget"

    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider(), placeholder: PlaceholderView()) { entry in
            ThreeMinutes_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("ThreeMinutes")
        .description("example widget by jeremy")
        .supportedFamilies([.systemMedium])//.systemSmall, .systemMedium,.systemLarge
    }
}

struct ThreeMinutes_widget_Previews: PreviewProvider {
    static var previews: some View {
        ThreeMinutes_widgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
