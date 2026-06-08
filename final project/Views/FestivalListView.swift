//
//  FestivalListView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct FestivalListView: View {
    @Binding var festivals: [Festival]
    @State private var showAddFestival = false
    
    var body: some View {
        NavigationStack {
            VStack {
                LottieView(name: "Music")
                    .frame(height: 160)
                
                List {
                    ForEach($festivals) { $festival in
                        NavigationLink {
                            FestivalDetailView(festival: $festival)
                        } label: {
                            FestivalRowView(festival: festival)
                        }
                    }
                }
            }
            .navigationTitle("音樂祭清單")
            .toolbar {
                Button {
                    showAddFestival = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $showAddFestival) {
                AddFestivalView(festivals: $festivals)
            }
        }
    }
}
