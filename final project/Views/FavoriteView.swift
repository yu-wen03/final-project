//
//  FavoriteView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct FavoriteView: View {
    @Binding var festivals: [Festival]
    
    var body: some View {
        NavigationStack {
            if festivals.filter({ $0.isFavorite }).isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "heart")
                        .font(.system(size: 70))
                        .foregroundStyle(.secondary)
                    
                    Text("尚未收藏音樂祭")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("收藏清單")
            } else {
                List {
                    ForEach($festivals) { $festival in
                        if festival.isFavorite {
                            NavigationLink {
                                FestivalDetailView(festival: $festival)
                            } label: {
                                FestivalRowView(festival: festival)
                            }
                        }
                    }
                }
                .navigationTitle("收藏清單")
            }
        }
    }
}
