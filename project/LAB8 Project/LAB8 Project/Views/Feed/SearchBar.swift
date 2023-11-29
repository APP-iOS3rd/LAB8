//
//  SearchBar.swift
//  LAB8 Project
//
//  Created by SeokkiKwon on 11/28/23.
//

import SwiftUI

// 서치바UI
struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack {
            TextField("", text:$text)
                .padding(8)
                .frame(height: 40)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 8)
                        }
                )
                .onTapGesture {
                    isEditing = true
                }
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                })
                {
                    Text("취소")
                }
            } else {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundColor(Color.mainColor)
            }
        }
    }
}

#Preview {
    SearchBar(text: .constant("some text"), isEditing: .constant(false))
}
