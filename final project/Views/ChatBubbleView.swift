//
//  ChatBubbleView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI

struct ChatBubbleView: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
            }
            
            Text(message.text)
                .font(.body)
                .padding()
                .foregroundStyle(.black)
                .background(
                    message.isUser
                    ? Color(red: 0.80, green: 0.86, blue: 0.95)
                    : Color(.systemGray6)
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .frame(maxWidth: 300, alignment: message.isUser ? .trailing : .leading)
                .shadow(color: .gray.opacity(0.15), radius: 8, x: 0, y: 4)
            
            if !message.isUser {
                Spacer()
            }
        }
    }
}
