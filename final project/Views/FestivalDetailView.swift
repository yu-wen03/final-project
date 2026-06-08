//
//  FestivalDetailView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct FestivalDetailView: View {
    @Binding var festival: Festival
    @State private var showWebsite = false
    @State private var showAlert = false
    @State private var heartScale = 1.0
    @State private var showEditFestival = false
    @State private var alertMessage = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(systemName: "guitars.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                    .background(
                        LinearGradient(
                            colors: [
                                Color(.systemGray5),
                                Color(.systemGray3)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .padding()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(festival.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    DetailCard(
                        title: "地點",
                        content: festival.location
                    )

                    DetailCard(
                        title: "活動日期",
                        content: "\(festival.startDate.formatted(date: .abbreviated, time: .omitted)) - \(festival.endDate.formatted(date: .abbreviated, time: .omitted))"
                    )

                    DetailCard(
                        title: "票價",
                        content: festival.price
                    )
                    
                    Toggle("是否參加", isOn: $festival.hasTicket)
                        .tint(Color.cyan.opacity(0.7))
                    
                    Button {
                        let wasFavorite = festival.isFavorite
                        
                        withAnimation(.spring) {
                            festival.isFavorite.toggle()
                            heartScale = 1.4
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.spring) {
                                heartScale = 1.0
                            }
                        }

                        alertMessage = wasFavorite ? "已取消收藏" : "已加入收藏"
                        showAlert = true
                    } label: {
                        HStack {
                            Image(systemName: festival.isFavorite ? "heart.fill" : "heart")
                                .scaleEffect(heartScale)

                            Text(festival.isFavorite ? "已收藏" : "加入收藏")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray3))
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    
                    Button {
                        showWebsite = true
                    } label: {
                        Text("前往官方ig")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray3))
                            .foregroundStyle(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("詳細資訊")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("編輯") {
                showEditFestival = true
            }
        }
        .sheet(isPresented: $showEditFestival) {
            EditFestivalView(festival: $festival)
        }
        .sheet(isPresented: $showWebsite) {
            FestivalWebView(urlString: festival.website)
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") { }
        }
    }
}

