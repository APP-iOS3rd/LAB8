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
    @Binding var Editing: Bool
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
                            if !text.isEmpty {
                                Button(action: textEdit, label: {
                                    Image(systemName: "xmark")
                                        .font(.title2)
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                        .padding(.trailing, 8)
                                })
                            } else if text.isEmpty || Editing == false{
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "magnifyingglass")
                                        .font(.title2)
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                        .padding(.trailing, 8)
                                })
                            } else {
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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
                    Editing = true
                }
        }
    }
    func textEdit() {
            text = ""
    }
    
}
#Preview {
    SearchViewBar(text: .constant("some text"), Editing: .constant(false))
}
