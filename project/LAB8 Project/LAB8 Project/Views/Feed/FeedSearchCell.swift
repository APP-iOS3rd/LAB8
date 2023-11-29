//
//  FeedSearchCell.swift
//  LAB8 Project
//
//  Created by SeokkiKwon on 11/28/23.
//

import SwiftUI

struct FeedSearchCell: View {
    var title: String
    var thumbnailUrl: String
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: thumbnailUrl))
                .frame(width: 80, height: 80)
                .scaledToFit()
                .clipped()
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                Text("글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 ")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                    .lineLimit(3)
            }
         
            Spacer()
        }
    }
}

#Preview {
    FeedSearchCell(title: "", thumbnailUrl: "")
}
