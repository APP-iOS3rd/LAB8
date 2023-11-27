//
//  LAB8_ProjectApp.swift
//  LAB8 Project
//
//  Created by 박선구 on 11/28/23.
//

import SwiftUI

@main
struct LAB8_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Network())
        }
    }
}
