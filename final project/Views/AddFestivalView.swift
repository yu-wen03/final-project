//
//  AddFestivalView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct AddFestivalView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var festivals: [Festival]
    
    @State private var title = ""
    @State private var location = ""
    @State private var price = ""
    @State private var website = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var hasTicket = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("基本資料") {
                    TextField("音樂祭名稱", text: $title)
                    TextField("地點", text: $location)
                    TextField("票價", text: $price)
                    TextField("官方ig(請輸入網址)", text: $website)
                        .keyboardType(.URL)
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
                    addFestival()
                } label: {
                    Text("新增音樂祭")
                        .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("新增音樂祭")
            .toolbar {
                Button("取消") {
                    dismiss()
                }
            }
            .alert(alertMessage, isPresented: $showAlert) {
                Button("OK") {
                    if alertMessage == "新增成功！" {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addFestival() {
        if title.isEmpty || location.isEmpty || price.isEmpty || website.isEmpty {
            alertMessage = "請填寫完整資料"
            showAlert = true
            return
        }
        
        let newFestival = Festival(
            title: title,
            location: location,
            startDate: startDate,
            endDate: endDate,
            price: price,
            website: website,
            hasTicket: hasTicket,
            isFavorite: false
        )
        
        festivals.append(newFestival)
        alertMessage = "新增成功！"
        showAlert = true
    }
}
