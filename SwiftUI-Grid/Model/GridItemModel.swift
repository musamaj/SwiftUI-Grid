//
//  GridItem.swift
//  SwiftUI-Grid
//
//  Created by Usama Jamil on 4/3/25.
//

import Foundation
import SwiftData

@Model
class GridItemModel {
    var id: UUID
    var title: String
    var color: String
    var createdAt: Date // Add this

    init(title: String, color: String) {
        self.id = UUID()
        self.title = title
        self.color = color
        self.createdAt = Date()
    }
}
