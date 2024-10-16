//
//  Color+Extension.swift
//  swift ui chatting
//
//  Created by Rahul Gangwar on 15.10.2024.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b, a: UInt64
        switch hex.count {
        case 6: // RGB (without alpha)
            (r, g, b, a) = (int >> 16, (int >> 8) & 0xFF, int & 0xFF, 255)
        case 8: // RGBA
            (r, g, b, a) = (int >> 24, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b, a) = (1, 1, 1, 1) // Default to white in case of error
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
