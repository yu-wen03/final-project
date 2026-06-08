//
//  AIRecommendView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI
import FoundationModels

struct AIRecommendView: View {
    let festivals: [Festival]
    
    @State private var messages: [ChatMessage] = [
        ChatMessage(
            text: "嗨！我是你的音樂祭 AI助理。可以跟我說你的需求，例如地區、票價預算，我可以推薦你適合的音樂祭呦！",
            isUser: false
        )
    ]
    
    @State private var inputText = ""
    @State private var isLoading = false
    
    var festivalNames: String {
        festivals.map { festival in
            "\(festival.title)：地點 \(festival.location)，票價 \(festival.price)"
        }
        .joined(separator: "\n")
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    ScrollViewReader { proxy in
                        ScrollView {
                            VStack(alignment: .leading, spacing: 16) {
                                ForEach(messages) { message in
                                    ChatBubbleView(message: message)
                                        .id(message.id)
                                }
                                
                                if isLoading {
                                    HStack {
                                        ProgressView()
                                        Text("AI 思考中...")
                                            .foregroundStyle(.secondary)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .padding()
                        }
                        .onChange(of: messages.count) {
                            if let last = messages.last {
                                withAnimation {
                                    proxy.scrollTo(last.id, anchor: .bottom)
                                }
                            }
                        }
                    }
                    
                    HStack(spacing: 10) {
                        TextField("輸入你的想法...", text: $inputText)
                            .padding()
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Button {
                            Task {
                                await sendMessage()
                            }
                        } label: {
                            Image(systemName: "paperplane.fill")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .frame(width: 56, height: 56)
                                .background(Color(.systemGray2))
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        .disabled(inputText.isEmpty || isLoading)
                    }
                    .padding()
                    .background(.white.opacity(0.8))
                }
            }
            .navigationTitle("AI 助理")
            .toolbar {
                Button {
                    messages = [
                        ChatMessage(
                            text: "嗨！我是你的音樂祭 AI 助理。可以跟我說你的需求，例如地區、票價預算，我可以推薦你適合的音樂祭呦！",
                            isUser: false
                        )
                    ]
                } label: {
                    Image(systemName: "trash")
                        .foregroundStyle(.cyan)
                }
            }
        }
    }
    
    func sendMessage() async {
        let userText = inputText
        inputText = ""
        
        messages.append(ChatMessage(text: userText, isUser: true))
        isLoading = true
        
        let lowerText = userText.lowercased()
        
        let matchedFestivals = festivals.filter { festival in
            userText.contains(festival.title) ||
            festival.location.contains(userText) ||
            festival.price.contains(userText) ||
            lowerText.contains("免費") && festival.price.contains("免費") ||
            lowerText.contains("台北") && festival.location.contains("台北") ||
            lowerText.contains("基隆") && festival.location.contains("基隆") ||
            lowerText.contains("桃園") && festival.location.contains("桃園") ||
            lowerText.contains("新竹") && festival.location.contains("新竹") ||
            lowerText.contains("台中") && festival.location.contains("台中") ||
            lowerText.contains("嘉義") && festival.location.contains("嘉義") ||
            lowerText.contains("台南") && festival.location.contains("台南") ||
            lowerText.contains("高雄") && festival.location.contains("高雄") ||
            lowerText.contains("屏東") && festival.location.contains("屏東")
        }
        
        if matchedFestivals.isEmpty {
            messages.append(ChatMessage(text: "很抱歉，這題我無法回覆。", isUser: false))
            isLoading = false
            return
        }
        
        let answer = matchedFestivals.prefix(3).map { festival in
            """
            \(festival.title)
            地點：\(festival.location)
            票價：\(festival.price)
            """
        }
            .joined(separator: "\n\n")
        
        messages.append(
            ChatMessage(
                text: """
                根據 App 內的音樂祭資料，我找到：
                
                \(answer)
                """,
                isUser: false
            )
        )
        
        isLoading = false
    }
}
