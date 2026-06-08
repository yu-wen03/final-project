//
//  DayScheduleView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct DayScheduleView: View {
    let selectedDate: Date
    @Binding var festivals: [Festival]
    @Binding var calendarEvents: [CalendarEvent]
    
    var festivalsOnSelectedDate: [Festival] {
        festivals.filter { festival in
            festival.hasTicket &&
            Calendar.current.startOfDay(for: selectedDate) >= Calendar.current.startOfDay(for: festival.startDate) &&
            Calendar.current.startOfDay(for: selectedDate) <= Calendar.current.startOfDay(for: festival.endDate)
        }
    }
    
    var eventsOnSelectedDate: [CalendarEvent] {
        calendarEvents.filter { event in
            Calendar.current.startOfDay(for: selectedDate) >= Calendar.current.startOfDay(for: event.startDate) &&
            Calendar.current.startOfDay(for: selectedDate) <= Calendar.current.startOfDay(for: event.endDate)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("音樂祭") {
                    if festivalsOnSelectedDate.isEmpty {
                        Text("當天沒有音樂祭")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(festivalsOnSelectedDate) { festival in
                            NavigationLink {
                                FestivalDetailReadOnlyView(festival: festival)
                            } label: {
                                Text("🎵 \(festival.title)")
                            }
                        }
                    }
                }
                
                Section("一般事項") {
                    if eventsOnSelectedDate.isEmpty {
                        Text("當天沒有一般事項")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(eventsOnSelectedDate) { event in
                            NavigationLink {
                                CalendarEventDetailView(
                                    event: event,
                                    calendarEvents: $calendarEvents
                                )
                            } label: {
                                Text("📌 \(event.title)")
                            }
                        }
                    }
                }
            }
            .navigationTitle(selectedDate.formatted(date: .abbreviated, time: .omitted))
        }
    }
}
