//
//  FeedView.swift
//  LAB8 Project
//
//  Created by SeokkiKwon on 11/28/23.
//

import SwiftUI

// Feed 메인화면
struct FeedView: View {
    @State var hideSearchBar = false
    @State var searchText: String = ""
    @State var isEditing: Bool = false
    
    var body: some View {
        VStack {
            // MARK: - search bar
                SearchBar(text: $searchText, isEditing: $isEditing)
                    .offset(y: hideSearchBar ? -40 : 0) // 위치를 이동시키는 offset 사용
                    .opacity(hideSearchBar ? 0 : 1)
                    .animation(.easeOut.speed(1.5))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            
            VStack(alignment: .leading){
                Divider()
            }
            .padding(.horizontal, 20)
            
                
            // 검색창 활성화 상태에 따라서 다른 뷰를 보여줌
            if isEditing {
                FeedListView(searchText: $searchText)
            } else {
                FeedGridView(hideSearchBar: $hideSearchBar)
                    .offset(y: hideSearchBar ? -40 : 0)
            }
        }
    }
}

#Preview {
    FeedView()
}
