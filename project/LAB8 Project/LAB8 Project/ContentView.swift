//
//  ContentView.swift
//  LAB8 Project
//
//  Created by 박선구 on 11/28/23.
//

import SwiftUI

// 커스텀 탭바
struct ContentView: View {
    
    @State var selectedTab = 0
    @State var tabSelection: TabBarItem = .home
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab){
                HomeView()
                    .tag(0)
                
                CommunityView()
                    .tag(1)
                
                PostView()
                    .tag(2)
                
                MyPageView()
                    .tag(3)
            }
            
            // 밖
//            ZStack{
//                HStack{
//                    ForEach((TabbedItem.allCases), id: \.self){ item in
//                        Button{
//                            selectedTab = item.rawValue
//                        } label: {
//                            CustomTabItem(imageName: item.iconName, isActive: (selectedTab == item.rawValue))
//                        }
//                    }
//                }
//            }
//            .background(.white.opacity(0.2))
//            .cornerRadius(35)
//            
//            // 바깥 테두리
//            .overlay(
//                RoundedRectangle(cornerRadius: 35)
//                    .stroke(lineWidth: 2)
//                    .foregroundStyle(.black.opacity(0.5))
//                )
//            .padding(.vertical, 10) // 탭바 높이
        }
    }
}

// 안
//extension ContentView{
//    func CustomTabItem(imageName: String, isActive: Bool) -> some View{
//        HStack(spacing: 10){
//            Spacer()
//                .frame(width: 40)
//                Image(systemName: imageName)
//                    .resizable()
//                    .renderingMode(.template)
//                    .foregroundStyle(isActive ? .black : .gray)
//                    .frame(width: isActive ? 30 : 20, height: isActive ? 30 : 20)
//            Spacer()
//                .frame(width: 40)
//        }
//        .frame(width: 80, height: 70)
//        .background(isActive ? .white.opacity(0.4) : .clear)
//        .cornerRadius(30)
//    }
//    
//    
//}

enum TabbedItem: Int, CaseIterable{
    case home = 0
    case community
    case written
    case mypage
    
    var iconName: String{
        switch self {
        case .home:
            return "house.fill"
        case .community:
            return "heart.text.square"
        case .written:
            return "magnifyingglass"
        case .mypage:
            return "person.fill"
        }
    }
}


enum TabBarItem: Hashable {
    case home, course, search, mypage
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .course:
            return "heart.text.square"
        case .search:
            return "magnifyingglass"
        case .mypage:
            return "person.fill"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "HOME"
        case .course:
            return "COURSE"
        case .search:
            return "SEARCH"
        case .mypage:
            return "MYPAGE"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return Color.red
        case .course:
            return Color.blue
        case .search:
            return Color.green
        case .mypage:
            return Color.orange
        }
    }
}





#Preview {
    ContentView()
        .environmentObject(Network())
}
