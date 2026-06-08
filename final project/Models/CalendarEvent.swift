//
//  CalendarEvent.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct CalendarEvent: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var startDate: Date
    var endDate: Date
    var note: String
}
