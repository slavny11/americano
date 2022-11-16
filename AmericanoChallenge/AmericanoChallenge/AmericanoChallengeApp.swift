//
//  AmericanoChallengeApp.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 16/11/22.
//

import SwiftUI

@main
struct AmericanoChallengeApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
