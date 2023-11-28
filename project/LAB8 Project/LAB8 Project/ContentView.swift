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
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab){
                MainView()
                    .tag(0)
                
                CommunityView()
                    .tag(1)
                
                WrittenView()
                    .tag(2)
                
                MyPageView()
                    .tag(3)
            }
            
            // 밖
            ZStack{
                HStack{
                    ForEach((TabbedItem.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
            }
            .background(.white.opacity(0.2))
            .cornerRadius(35)
            
            // 바깥 테두리
            .overlay(
                RoundedRectangle(cornerRadius: 35)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.black.opacity(0.5))
                )
//            .padding(.vertical, 10) // 탭바 높이
        }
    }
}

// 안
extension ContentView{
    func CustomTabItem(imageName: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
                .frame(width: 40)
                Image(systemName: imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(isActive ? .black : .gray)
                    .frame(width: isActive ? 30 : 20, height: isActive ? 30 : 20)
            Spacer()
                .frame(width: 40)
        }
        .frame(width: 80, height: 70)
        .background(isActive ? .white.opacity(0.4) : .clear)
        .cornerRadius(30)
    }
}

enum TabbedItem: Int, CaseIterable{
    case home = 0
    case community
    case written
    case mypage
    
    var iconName: String{
        switch self {
        case .home:
            return "house"
        case .community:
            return "heart.text.square"
        case .written:
            return "pencil"
        case .mypage:
            return "person"
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Network())
}
