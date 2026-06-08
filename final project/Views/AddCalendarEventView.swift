//
//  AddCalendarEventView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct AddCalendarEventView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var calendarEvents: [CalendarEvent]
    
    @State private var title = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var note = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("事項內容") {
                    TextField("事項名稱", text: $title)
                    
                    DatePicker("開始日期", selection: $startDate, displayedComponents: .date)

                    DatePicker(
                        "結束日期",
                        selection: $endDate,
                        in: startDate...,
                        displayedComponents: .date
                    )
                    
                    TextField("備註", text: $note)
                }
                
                Button {
                    if title.isEmpty {
                        showAlert = true
                    } else {
                        let newEvent = CalendarEvent(
                            title: title,
                            startDate: startDate,
                            endDate: endDate,
                            note: note
                        )
                        
                        calendarEvents.append(newEvent)
                        dismiss()
                    }
                } label: {
                    Text("新增事項")
                        .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("新增行事曆事項")
            .toolbar {
                Button("取消") {
                    dismiss()
                }
            }
            .alert("請輸入事項名稱", isPresented: $showAlert) {
                Button("OK") { }
            }
        }
    }
}
