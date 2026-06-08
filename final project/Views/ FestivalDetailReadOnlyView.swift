//
//   FestivalDetailReadOnlyView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct FestivalDetailReadOnlyView: View {
    let festival: Festival
    
    var body: some View {
        Form {
            Section("音樂祭資訊") {
                Text(festival.title)
                Text(festival.location)
                Text(
                    "\(festival.startDate.formatted(date: .abbreviated, time: .omitted)) - \(festival.endDate.formatted(date: .abbreviated, time: .omitted))"
                )
                Text(festival.price)
            }
        }
        .navigationTitle("音樂祭詳細資訊")
    }
}
