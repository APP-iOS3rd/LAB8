//
//  AppTabBarView.swift
//  LAB8 Project
//
//  Created by 이민영 on 2023/11/29.
//

import SwiftUI

struct AppTabBarView: View {
    @State var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            MainView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            Color.red
                .tabBarItem(tab: .home, selection: $tabSelection)
                
            Color.blue
                .tabBarItem(tab: .course, selection: $tabSelection)
            Color.green
                .tabBarItem(tab: .search, selection: $tabSelection)
            Color.orange
                .tabBarItem(tab: .mypage, selection: $tabSelection)
        }
    }
}

#Preview {
    AppTabBarView()
}
