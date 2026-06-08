//
//   FestivalRowView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct FestivalRowView: View {
    let festival: Festival
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "music.note.house.fill")
                .font(.system(size: 36))
                .foregroundStyle(.gray)
                .frame(width: 60, height: 60)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(festival.title)
                    .font(.headline)
                
                Text(festival.location)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            if festival.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
            }
        }
        .padding(.vertical, 6)
    }
}
