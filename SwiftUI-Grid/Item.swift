//
//  Item.swift
//  SwiftUI-Grid
//
//  Created by Usama Jamil on 4/3/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
