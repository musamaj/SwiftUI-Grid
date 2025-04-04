//
//  SwiftUI_GridUITests.swift
//  SwiftUI-GridUITests
//
//  Created by Usama Jamil on 4/3/25.
//

import XCTest
import SwiftUI
import XCTest
import SnapshotTesting
import SwiftData

@testable import ViewInspector
@testable import SwiftUI_Grid

final class SwiftUI_GridUITests: XCTestCase {
    var modelContext: ModelContext!
    var viewModel: GridViewModel!
    var view: GridView!
    
    @MainActor override func setUp() {
        super.setUp()
        
        let schema = Schema([GridItemModel.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: [config])
        
        modelContext = container.mainContext
        viewModel = GridViewModel(modelContext: modelContext)
        view = GridView(modelContext: modelContext)
    }
    
    func testDefaultGridAppearance() {
        let view = GridView(modelContext: modelContext)
        assertSnapshot(of: view, as: .image(layout: .fixed(width: 300, height: 600)))
    }
    
    func testAddingItemUpdatesGrid() {
        viewModel.addItem()
        let view = GridView(modelContext: modelContext)
        assertSnapshot(of: view, as: .image(layout: .fixed(width: 300, height: 600)))
    }
    
    func testDeletingItemUpdatesGrid() {
        viewModel.addItem()
        let firstItem = viewModel.items.first!
        viewModel.deleteItem(firstItem)
        
        let view = GridView(modelContext: modelContext)
        assertSnapshot(of: view, as: .image(layout: .fixed(width: 300, height: 600)))
    }
}
