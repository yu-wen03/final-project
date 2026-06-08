//
//  CalendarEventDetailView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct CalendarEventDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    let event: CalendarEvent
    @Binding var calendarEvents: [CalendarEvent]
    
    var body: some View {
        Form {
            Section("事項資訊") {
                Text(event.title)
                Text(
                    "\(event.startDate.formatted(date: .abbreviated, time: .omitted)) - \(event.endDate.formatted(date: .abbreviated, time: .omitted))"
                )
                Text(event.note.isEmpty ? "無備註" : event.note)
            }
            
            Button(role: .destructive) {
                calendarEvents.removeAll { $0.id == event.id }
                dismiss()
            } label: {
                Text("刪除事項")
            }
        }
        .navigationTitle("事項詳細資訊")
    }
}
