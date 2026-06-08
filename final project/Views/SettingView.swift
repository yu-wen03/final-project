//
//  SettingView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct SettingView: View {
    @Binding var userName: String
    
    var body: some View {
        NavigationStack {
            Form {
                Section("使用者資料") {
                    TextField("使用者名稱", text: $userName)
                        .foregroundStyle(.secondary)
                }
                
                Section("說明") {
                    Text("這裡使用 AppStorage 儲存使用者名稱，關閉 App 後資料仍會保留。")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("設定")
        }
    }
}
