//
//  Festival.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI
import Foundation

struct Festival: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var location: String
    var startDate: Date
    var endDate: Date
    var price: String
    var website: String
    var hasTicket: Bool
    var isFavorite: Bool
}
