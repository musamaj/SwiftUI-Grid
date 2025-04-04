//
//  ContentView.swift
//  SwiftUI-Grid
//
//  Created by Usama Jamil on 4/3/25.
//

import SwiftUI
import SwiftData

struct GridView: View {
    
    @State private var showDeleteAlert = false
    @StateObject private var viewModel: GridViewModel
    
    let columns = [GridItem(.adaptive(minimum: 100, maximum: 120))]
    
    init(modelContext: ModelContext) {
        _viewModel = StateObject(wrappedValue: GridViewModel(modelContext: modelContext))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.items, id: \.id) { item in
                        Text(item.title)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                            .onTapGesture {
                                showDeleteAlert = true
                            }
                            .alert("Delete Item?", isPresented: $showDeleteAlert) {
                                Button("Delete", role: .destructive) {
                                    viewModel.deleteItem(item)
                                }
                                Button("Cancel", role: .cancel) { }
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("SwiftData Grid")
            .toolbar {
                Button("Add Item") {
                    viewModel.addItem()
                }
            }
        }
    }
}

#Preview {
    @Previewable @Environment(\.modelContext) var modelContext
    GridView(modelContext: modelContext)
        .modelContainer(for: GridItemModel.self, inMemory: true)
}
