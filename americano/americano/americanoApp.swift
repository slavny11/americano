//
//  americanoApp.swift
//  americano
//
//  Created by Viacheslav on 16/11/22.
//

import SwiftUI

@main
struct americanoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
