//
//  SearchFilterVIew.swift
//  LAB8 Project
//
//  Created by 박선구 on 11/30/23.
//

import SwiftUI

struct SearchFilterVIew: View {
    
//    @State var isPresented : Bool = false
    @Binding var isPresented : Bool
    
    var body: some View {
        HStack{
            Button(action: filterButton, label: {
                Image(systemName: "number")
//                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.black)
                    )
            })
            .padding(.horizontal, 10)
            .sheet(isPresented: $isPresented, content: {
                FIlterView()
                    .presentationDetents([.fraction(0.8)])
                    .presentationCornerRadius(50)
                
            })
            Button(action: {}, label: {
                Text("전체")
                    .frame(width: 60, height: 35)
                    .foregroundStyle(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.gray)
//                            .shadow(radius: 2, x: 0, y: 2)
                    )
            })
            Button(action: {}, label: {
                Text("놀거리")
                    .frame(width: 60, height: 35)
                    .foregroundStyle(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.gray)
//                            .shadow(radius: 2, x: 0, y: 2)
                )
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("맛집")
                    .frame(width: 60, height: 35)
                    .foregroundStyle(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.gray)
//                            .shadow(radius: 2, x: 0, y: 2)
                    )
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("카페")
                    .frame(width: 60, height: 35)
                    .foregroundStyle(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.gray)
//                            .shadow(radius: 2, x: 0, y: 2)
                    )
            })
        }
        .padding(.horizontal, 20)
    }
    func filterButton() {
        isPresented = true
    }
}

//#Preview {
//    SearchFilterVIew(isPresented: false)
//}
