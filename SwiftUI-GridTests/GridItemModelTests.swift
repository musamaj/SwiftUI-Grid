//
//  GridItemModelTests.swift
//  SwiftUI-Grid
//
//  Created by Usama Jamil on 4/3/25.
//

import Testing
import SwiftData
@testable import SwiftUI_Grid

struct GridItemModelTests {
    func testModelInitialization() {
        let item = GridItemModel(title: "Test Item", color: "#FF5733")

        #expect(item.title == "Test Item")
        #expect(item.color == "#FF5733")
        #expect(item.id != nil)
    }
}
