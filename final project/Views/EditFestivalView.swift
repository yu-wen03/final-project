//
//  EditFestivalView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct EditFestivalView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var festival: Festival
    
    @State private var location = ""
    @State private var price = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("不可修改") {
                    Text("音樂祭名稱：\(festival.title)")
                    Text("官方IG：\(festival.website)")
                }
                
                Section("可修改資料") {
                    TextField("地點", text: $location)
                    TextField("票價", text: $price)
                }
                
                Section("活動日期") {
                    DatePicker("開始日期", selection: $startDate, displayedComponents: .date)
                    
                    DatePicker(
                        "結束日期",
                        selection: $endDate,
                        in: startDate...,
                        displayedComponents: .date
                    )
                }
                
                Button {
                    saveEdit()
                } label: {
                    Text("儲存修改")
                        .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("編輯音樂祭")
            .toolbar {
                Button("取消") {
                    dismiss()
                }
            }
            .onAppear {
                location = festival.location
                price = festival.price
                startDate = festival.startDate
                endDate = festival.endDate
            }
            .alert("請填寫完整資料", isPresented: $showAlert) {
                Button("OK") { }
            }
        }
    }
    
    func saveEdit() {
        if location.isEmpty || price.isEmpty {
            showAlert = true
            return
        }
        
        festival.location = location
        festival.price = price
        festival.startDate = startDate
        festival.endDate = endDate
        
        dismiss()
    }
}
