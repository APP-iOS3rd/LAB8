//
//  SearchViewBar.swift
//  LAB8 Project
//
//  Created by 박선구 on 11/30/23.
//

import SwiftUI

// 서치바UI
struct SearchViewBar: View {
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
                            Spacer()
                                if isEditing == true {
                                    Button(action: {
                                        isEditing = false
                                        text = ""
                                        UIApplication.shared.endEditing()
                                    }, label: {
                                        Text("X")
                                    })
                                } else {
                                    Button(action: {
                                    
                                    }, label: {
                                        Image(systemName: "magnifyingglass")
                                            .font(.title2)
                                            .foregroundColor(.gray)
                                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                            .padding(.trailing, 8)
                                    })
                                }
                        }
                            .padding()
                )
                .onTapGesture {
                    isEditing = true
                }
        }
    }
    
}
#Preview {
    SearchViewBar(text: .constant("some text"), isEditing: .constant(false))
}
