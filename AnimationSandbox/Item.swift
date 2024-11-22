//
//  Item.swift
//  AnimationSandbox
//
//  Created by Fabian Knecht on 22.11.2024.
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
