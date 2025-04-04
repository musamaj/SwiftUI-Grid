//
//  GridViewModelTests.swift
//  SwiftUI-Grid
//
//  Created by Usama Jamil on 4/3/25.
//

import Testing
import SwiftData
import SwiftUI
@testable import SwiftUI_Grid

struct GridViewModelTests {
    @State var modelContext: ModelContext!
    @State var viewModel: GridViewModel!

    @MainActor func setUp() {
        let schema = Schema([GridItemModel.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true) // In-memory DB for testing
        let container = try! ModelContainer(for: schema, configurations: [config])

        modelContext = container.mainContext
        viewModel = GridViewModel(modelContext: modelContext)
    }

    func testFetchItemsInitiallyEmpty() {
        #expect(viewModel.items.count == 0)
    }

    func testAddingItem() {
        viewModel.addItem()

        #expect(viewModel.items.count == 1)
        #expect(viewModel.items.first?.title == "Item 1")
    }

    func testDeletingItem() {
        viewModel.addItem()
        let firstItem = viewModel.items.first!

        viewModel.deleteItem(firstItem)

        #expect(viewModel.items.count == 0)
    }

    func testSortingItems() {
        let itemA = GridItemModel(title: "Apple", color: "#123456")
        let itemB = GridItemModel(title: "Banana", color: "#654321")

        modelContext.insert(itemB)
        modelContext.insert(itemA)

        viewModel.fetchItems()

        #expect(viewModel.items.first?.title == "Apple") 
    }
}
