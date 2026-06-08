//
//  ChatMessage.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI
import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}
