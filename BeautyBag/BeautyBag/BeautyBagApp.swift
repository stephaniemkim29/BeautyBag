//
//  BeautyBagApp.swift
//  BeautyBag
//
//  Created by Stephanie Kim on 11/16/24.
//

import SwiftUI

@main
struct BeautyBagApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ProfileView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
