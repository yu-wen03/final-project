//
//  FestivalCalendarView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct FestivalCalendarView: View {
    @Binding var festivals: [Festival]
    @Binding var calendarEvents: [CalendarEvent]
    
    @State private var currentMonth = Date()
    @State private var showAddEvent = false
    @State private var selectedDate = Date()
    @State private var showDaySchedule = false
    
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    let weekDays = ["日", "一", "二", "三", "四", "五", "六"]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        currentMonth = changeMonth(by: -1)
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    
                    Spacer()
                    
                    Text(currentMonth.formatted(.dateTime.year().month()))
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        currentMonth = changeMonth(by: 1)
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                }
                .padding()
                
                LazyVGrid(columns: columns) {
                    ForEach(weekDays, id: \.self) { day in
                        Text(day)
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: columns, spacing: 14) {
                    ForEach(makeCalendarDays(), id: \.self) { date in
                        if let date = date {
                            CalendarDayCell(
                                date: date,
                                festivals: festivalsOn(date),
                                events: eventsOn(date)
                            ) {
                                selectedDate = date
                                showDaySchedule = true
                            }
                        } else {
                            Color.clear
                                .frame(height: 80)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("行事曆")
            .toolbar {
                Button {
                    showAddEvent = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $showAddEvent) {
                AddCalendarEventView(calendarEvents: $calendarEvents)
            }
            .sheet(isPresented: $showDaySchedule) {
                DayScheduleView(
                    selectedDate: selectedDate,
                    festivals: $festivals,
                    calendarEvents: $calendarEvents
                )
            }
        }
    }
    
    func festivalsOn(_ date: Date) -> [Festival] {
        festivals.filter { festival in
            festival.hasTicket &&
            Calendar.current.startOfDay(for: date) >= Calendar.current.startOfDay(for: festival.startDate) &&
            Calendar.current.startOfDay(for: date) <= Calendar.current.startOfDay(for: festival.endDate)
        }
    }
    
    func eventsOn(_ date: Date) -> [CalendarEvent] {
        calendarEvents.filter { event in
            Calendar.current.startOfDay(for: date) >= Calendar.current.startOfDay(for: event.startDate) &&
            Calendar.current.startOfDay(for: date) <= Calendar.current.startOfDay(for: event.endDate)
        }
    }
    
    func makeCalendarDays() -> [Date?] {
        let calendar = Calendar.current
        
        guard let monthInterval = calendar.dateInterval(of: .month, for: currentMonth),
              let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
              let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end)
        else {
            return []
        }
        
        var days: [Date?] = []
        var date = monthFirstWeek.start
        
        while date < monthLastWeek.end {
            if calendar.isDate(date, equalTo: currentMonth, toGranularity: .month) {
                days.append(date)
            } else {
                days.append(nil)
            }
            
            guard let nextDate = calendar.date(byAdding: .day, value: 1, to: date) else {
                break
            }
            
            date = nextDate
        }
        
        return days
    }
    
    func changeMonth(by value: Int) -> Date {
        Calendar.current.date(byAdding: .month, value: value, to: currentMonth) ?? currentMonth
    }
}
