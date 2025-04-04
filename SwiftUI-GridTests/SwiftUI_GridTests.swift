//
//  SwiftUI_GridTests.swift
//  SwiftUI-GridTests
//
//  Created by Usama Jamil on 4/3/25.
//

import Testing
import SwiftUI
import SwiftData
@testable import SwiftUI_Grid

struct SwiftUI_GridTests {
    
    @State var modelContext: ModelContext!
    @State var viewModel: GridViewModel!
    @State var view: GridView!
    
    @MainActor func setUp() {
        let schema = Schema([GridItemModel.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: [config])
        
        modelContext = container.mainContext
        viewModel = GridViewModel(modelContext: modelContext)
        view = GridView(modelContext: modelContext)
    }
    
    func testAddingItemFromView() {
        #expect(viewModel.items.count == 0)
        
        viewModel.addItem()
        
        #expect(viewModel.items.count == 1)
    }
}
