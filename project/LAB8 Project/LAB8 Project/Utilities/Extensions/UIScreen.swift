//
//  UIScreen.swift
//  LAB8 Project
//
//  Created by SeokkiKwon on 11/28/23.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
