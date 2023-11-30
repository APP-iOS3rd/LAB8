//
//  SearchView.swift
//  LAB8 Project
//
//  Created by 박선구 on 11/30/23.
//

import SwiftUI

struct SearchView: View {
    private var  data: [Int] = Array(1...10)
//    private let colors: [Color] = [.red, .green, .blue, .yellow]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 180))
    ]
    
    @State var hideSearchBar = false
    @State var searchText: String = ""
    @State var Editing: Bool = false
    @State var isPresented : Bool = false
    @State var like : Bool = false
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                SearchViewBar(text: $searchText, Editing: $Editing)
                    .offset(y: hideSearchBar ? -40 : 0) // 위치를 이동시키는 offset 사용
                    .opacity(hideSearchBar ? 0 : 1)
                    .animation(.easeOut.speed(1.5))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .shadow(color: .gray ,radius: 2, x: 0, y: 2)
                
                SearchFilterVIew(isPresented: $isPresented)
//                Divider()
            }
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading){
                    Text("검색결과")
                    Divider()
                }
                .padding(.horizontal, 10)
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .frame(width: 180, height: 230)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                            
                            VStack(alignment: .leading){
                                Image("testImage")
                                    .resizable()
                                    .frame(width: 170, height: 150)
                                    .cornerRadius(10)
                                    .shadow(color: .gray, radius: 5)
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("반서울")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                        Text("#찜 70 #3만이하")
                                    }
                                    .padding(.horizontal, 9)
                                    
                                    Button(action: presslike, label: {
                                        Image(systemName: "heart")
                                            .foregroundColor(.black)
                                            .shadow(radius: 3)
//                                            .foregroundStyle(like ? .red : .gray)
//                                            .symbolEffect(.bounce, value: like)
                                    })
                                }
                            }
                        }
                    }
                }
            }
            .padding(10)
//            .padding(.bottom, -30)
        }
    }
    func presslike() {
        if like == false {
            like = true
        } else {
            like = false
        }
//        like = like ? true : false
    }
}

#Preview {
    SearchView()
}
