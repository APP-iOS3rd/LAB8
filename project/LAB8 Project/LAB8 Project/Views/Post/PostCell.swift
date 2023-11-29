//
//  PostCell.swift
//  LAB8 Project
//
//  Created by SeokkiKwon on 11/28/23.
//

import SwiftUI

struct PostCell: View {
    var width: CGFloat
    var body: some View {
        VStack {
            VStack(alignment:.leading) {
            // 썸네일
                AsyncImage(url: URL(string: "https://mediahub.seoul.go.kr/uploads/mediahub/2022/03/jQKPiHwVACtDTcJKuGLKDxCCytGhMjbV.jpg"))
                    .scaledToFit()
                    .frame(width: width, height: width)
                    .clipped()
                    .cornerRadius(8)
                
                VStack(alignment:.leading) {
                    Text("이름:")
                    Text("가격:")
                }
            }
        }
        .frame(width: width, height: width)
    }
}

#Preview {
    PostCell(width: 200)
}
