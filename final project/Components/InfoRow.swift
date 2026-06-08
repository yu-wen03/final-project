//
//  InfoRow.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.bold)
            
            Spacer()
            
            Text(value)
                .foregroundStyle(.secondary)
        }
    }
}
