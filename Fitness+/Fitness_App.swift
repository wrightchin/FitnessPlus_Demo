//
//  Fitness_App.swift
//  Fitness+
//
//  Created by Wright Chin on 11/11/2021.
//

import SwiftUI

@available(iOS 15.0, *)
@main
struct Fitness_App: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var studioModel = StudioModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(studioModel)
        }
    }
}
