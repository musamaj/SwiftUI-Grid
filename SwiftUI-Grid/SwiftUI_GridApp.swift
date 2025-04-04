//
//  SwiftUI_GridApp.swift
//  SwiftUI-Grid
//
//  Created by Usama Jamil on 4/3/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_GridApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([GridItemModel.self])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false) // Persistent storage
        return try! ModelContainer(for: schema, configurations: [configuration])
    }()
    
    var body: some Scene {
        WindowGroup {
            GridView(modelContext: sharedModelContainer.mainContext)
                .modelContainer(sharedModelContainer)
        }
    }
}
