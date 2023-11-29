//
//  Color.swift
//  LAB8 Project
//
//  Created by SeokkiKwon on 11/28/23.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
       let scanner = Scanner(string: hex)
       _ = scanner.scanString("#")
       
       var rgb: UInt64 = 0
       scanner.scanHexInt64(&rgb)
       
       let r = Double((rgb >> 16) & 0xFF) / 255.0
       let g = Double((rgb >>  8) & 0xFF) / 255.0
       let b = Double((rgb >>  0) & 0xFF) / 255.0
       self.init(red: r, green: g, blue: b)
     }
    
    static let mainColor = Color(hex: "F9688D")
}
