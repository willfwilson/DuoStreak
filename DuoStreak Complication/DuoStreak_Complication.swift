//
//  DuoStreak_Complication.swift
//  DuoStreak Complication
//
//  Created by William Wilson on 19/10/2022.
//

import WidgetKit
import SwiftUI
import Intents
//import ClockKit






struct Provider: TimelineProvider {
    
    let myURLString = "https://duome.eu/willfw"
    var initialisor = 0
//    let myURLString = "https://duome.eu/christi3"
// let myURLString = "https://duome.eu/DeeRamm"
//    let myURLString = "https://duome.eu/Sarah404234"
    static var imageName = "Streak_Unfulfilled"
    static var test: String?
    static var initial = 0
    
//    var hasFetchedStreak: Bool!
    
    
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        
        DispatchQueue.main.sync{
        
        
        let date = Date()
        
        var entry: StreakEntry
//                DispatchQueue.global(qos: .background).async {
        
//            let myHTMLString = try! URL(string: myURLString)
//
//                .flatMap { try Data(contentsOf: $0) }
//
//                .flatMap { String(data: $0, encoding: .ascii) }
//
//            //            print(type(of: myHTMLString))
//
//            if (myHTMLString!.contains("streak extended today")) {
////                imageName = "Streak_FulfilledColour"
//                //                Image("Streak_FulfilledColour").imageScale(.small)
//                print("streak extended")
//
//                //       //         Provider.test = imageName
//
//                entry = StreakEntry(date: date, StreakStatus: "Streak_FulfilledColour")
//
//            } else {
//                //                ContentView.streak = false
////                imageName = "Streak_Unfulfilled"
//                print("streak not extended")
//                //        //        Provider.test = imageName
//
//
                entry = StreakEntry(date: date, StreakStatus: "Streak_Unfulfilled")
//            }
            
            //        }
            //        if context.isPreview && !hasFetchedStreak {
            //            entry = StreakEntry(date: date, StreakStatus: "-")
            //        } else {
            
            //        }
            completion(entry)
        }
    }
    
    
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<StreakEntry>) -> Void) {
        // Create a timeline entry for "now."
        
        let date = Date()
//        if Provider.initial == 0
//        {
//            Provider.test = "Streak_FulfilledWhite"
//        }
//        Provider.initial = 1
        
        let myHTMLString = try! URL(string: myURLString)

            .flatMap { try! Data(contentsOf: $0) }

            .flatMap { String(data: $0, encoding: .ascii) }

        //            print(type(of: myHTMLString))
        
        if (myHTMLString!.contains("streak extended today")) {
            Provider.imageName = "Streak_FulfilledColour"
            //                Image("Streak_FulfilledColour").imageScale(.small)

            print("streak extended")
//                Provider.test = "Streak_FulfilledColour"




        } else {
            //                ContentView.streak = false
            Provider.imageName = "Streak_Unfulfilled"
            print("streak not extended")
//                Provider.test = "Streak_FulfilledColour"




        }
        
        let entry = StreakEntry(
            date: date,
            StreakStatus: Provider.imageName
        
 
        )
        
        // Create a date that's 15 minutes in the future.
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 5, to: date)!
        print(nextUpdateDate as Any)
        // Create the timeline with the entry and a reload policy with the date
        // for the next update.
        let timeline = Timeline(
            entries:[entry],
            policy: .after(nextUpdateDate)
        )
        print(timeline as Any)
//        WidgetCenter.shared.reloadAllTimelines()
//
//        DispatchQueue.global(qos: .background).async {

//
//        }
        // Call the completion to pass the timeline to WidgetKit.
        completion(timeline)
    }
    
    func placeholder(in context: Context) -> StreakEntry {
        StreakEntry(date: Date(),StreakStatus:Provider.imageName)
    }
    
    struct StreakEntry: TimelineEntry {
        var date: Date
        var StreakStatus: String
    }
}
    
//    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date(),ImageName:"test")
//        completion(entry)
//    }
//
//    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
    



   


        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate, configuration: configuration)
//            entries.append(entry)
//        }

    
//    func recommendations() -> [IntentRecommendation<ConfigurationIntent>] {
//        return [
//            IntentRecommendation(intent: ConfigurationIntent(), description: "My  Widget")
//        ]
//    }


//struct SimpleEntry: TimelineEntry {
//    var date: Date
//    var ImageName: String
////    let configuration: ConfigurationIntent
//}

@main

struct DuoStreak_Complication: Widget {
    let kind: String = "DuoStreak_Complication"
    
    

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind,
                            provider: Provider()
        ){ entry in
            DuoStreak_ComplicationEntryView(streakIcon: entry.StreakStatus)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct DuoStreak_ComplicationEntryView : View {
    //    var entry: Provider.Entry
    //    @Environment(\.widgetFamily) var family: WidgetFamily
    @State var streakIcon: String!
    //    var StreakIcon = "Streak_FulfilledWhite"
    //    var StreakIcon = "Streak_Unfulfilled"
    
    var body: some View {
        //        Text("test")
        
        Image(streakIcon).scaledToFit()
        
        //        Image(Provider.test ?? "Streak_Unfulfilled").scaledToFit()
        
        
        //
        
    }}
////
//}
//
//struct DuoStreak_Complication_Previews: PreviewProvider {
//    static var previews: some View {
//        DuoStreak_ComplicationEntryView()
//
//            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
//    }
//}
