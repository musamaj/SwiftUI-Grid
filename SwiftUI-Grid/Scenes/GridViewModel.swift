//
//  GridViewModel.swift
//  SwiftUI-Grid
//
//  Created by Usama Jamil on 4/3/25.
//

import SwiftUI
import SwiftData

class GridViewModel: ObservableObject {
    private let modelContext: ModelContext
    @Published var items: [GridItemModel] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchItems()
    }
    
    func fetchItems() {
        let fetchDescriptor = FetchDescriptor<GridItemModel>(sortBy: [SortDescriptor(\.title)])
        do {
            items = try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Error fetching items: \(error)")
        }
    }
    
    func addItem() {
        let newItem = GridItemModel(title: "Item \(items.count+1)", color: "#FF5733")
        modelContext.insert(newItem)
        fetchItems() // Refresh UI
    }
    
    func deleteItem(_ item: GridItemModel) {
        modelContext.delete(item)
        fetchItems() // Refresh UI
    }
}
