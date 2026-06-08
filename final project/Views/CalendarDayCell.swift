//
//  CalendarDayCell.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct CalendarDayCell: View {
    let date: Date
    let festivals: [Festival]
    let events: [CalendarEvent]
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            VStack(spacing: 4) {
                Text("\(Calendar.current.component(.day, from: date))")
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                ForEach(festivals.prefix(1)) { festival in
                    Text("🎵 \(festival.title)")
                        .font(.caption2)
                        .lineLimit(1)
                        .padding(3)
                        .frame(maxWidth: .infinity)
                        .background(.purple.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                
                ForEach(events.prefix(1)) { event in
                    Text(" \(event.title)")
                        .font(.caption2)
                        .lineLimit(1)
                        .padding(3)
                        .frame(maxWidth: .infinity)
                        .background(.blue.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                
                Spacer()
            }
            .frame(height: 80)
            .padding(4)
            .background((festivals.isEmpty && events.isEmpty) ? .clear : .gray.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .buttonStyle(.plain)
    }
}
