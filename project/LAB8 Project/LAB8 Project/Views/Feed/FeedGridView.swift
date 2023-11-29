//
//  FeedGridView.swift
//  LAB8 Project
//
//  Created by SeokkiKwon on 11/28/23.
//

import SwiftUI

struct Feed: Identifiable {
    
    var id = UUID()
    var title:String
    var thumbnailUrl: String
}

struct FeedGridView: View {
    @Binding var hideSearchBar: Bool
    @State private var offset: CGFloat = 0
    @State private var lastOffset: CGFloat = 0
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    private let datas = [
        Feed(title: "명동 데이트 코스", thumbnailUrl: "https://a.cdn-hotels.com/gdcs/production195/d158/5430f599-4c72-4d16-b597-c2f33670c781.jpg"),
        Feed(title: "인천 데이트 코스", thumbnailUrl: "https://a.cdn-hotels.com/gdcs/production167/d1393/d758b422-9731-44ee-9afa-1ab907b80019.jpg"),
        Feed(title: "명동 데이트 코스", thumbnailUrl: "https://mediahub.seoul.go.kr/uploads/mediahub/2023/07/vewcUVNSjljhxQIDgEKsvoTgSxkCgmds.jpg"),
        Feed(title: "여주 데이트 코스", thumbnailUrl: "https://hng.yna.co.kr/media/content/1109/1490943403069934.jpg"),
        Feed(title: "이천 데이트 코스", thumbnailUrl: "https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/P7F/image/eEMn2TDuiiBQUrC14MmuCmfqezY"),
        Feed(title: "평택 데이트 코스", thumbnailUrl: "https://wimg.mk.co.kr/meet/neds/2021/07/image_readtop_2021_672767_16261164634713655.jpg"),
        Feed(title: "화성 데이트 코스", thumbnailUrl: "https://post-phinf.pstatic.net/MjAyMjAzMjdfMjg0/MDAxNjQ4MzYyMTI5MzM0.4x7WsHCjMvhUQU_ko10TxaufMAdThyfRsbVVQ9s16oYg._kJmEpEq9rnJJJKwiMEQ-OZbK52-eFloussQ7XNxySog.JPEG/%EC%97%AC%EC%9D%98%EB%8F%84-%EC%9D%B4%EB%9E%9C%EB%93%9C%ED%81%AC%EB%A3%A8%EC%A6%88.jpg?type=w800_q75"),
        Feed(title: "용인 데이트 코스", thumbnailUrl: "https://cdn.imweb.me/upload/S201701015868e87bb6cc8/b98d87dc0ed15.jpg"),
        Feed(title: "수원 데이트 코스", thumbnailUrl: "https://kr.imboldn.com/wp-content/uploads/2022/04/01-A.jpg"),
        Feed(title: "속초 데이트 코스", thumbnailUrl: "https://image.jtbcplus.kr/data/contents/jam_photo/202101/21/a06cfa85-6b0d-4389-9962-9008ddf41c98.jpg"),
        Feed(title: "홍천 데이트 코스", thumbnailUrl: "https://img.gokorea.kr/news/photo/201906/227355_523950_029.jpg"),
        Feed(title: "충주 데이트 코스", thumbnailUrl: "https://a.cdn-hotels.com/gdcs/production50/d479/7234b396-451a-4974-808a-eb9f857709a8.jpg"),
        Feed(title: "가평 데이트 코스", thumbnailUrl: "https://cdn.3hoursahead.com/v2/content/image-comp/4d9c9237-2502-48fc-a7c7-5d408bfa69c7.webp"),
        Feed(title: "춘천 데이트 코스", thumbnailUrl: "https://ak-d.tripcdn.com/images/1i62622349h30gxfkE7C1.jpg?proc=source/trip"),
        Feed(title: "청주 데이트 코스", thumbnailUrl: "https://lh5.googleusercontent.com/p/AF1QipOdWGA-paOx0u4UTOqfy94CffAyvuL3cZqOy47K"),
        Feed(title: "충주 데이트 코스", thumbnailUrl: "https://a.cdn-hotels.com/gdcs/production120/d1269/9621f6c3-750e-4183-bf43-5c1823085c74.jpg"),
        Feed(title: "인제 데이트 코스", thumbnailUrl: "https://blog.kakaocdn.net/dn/bvJzR9/btrliMhFT9F/kTIHV4u67tMEf7QaYcNjyk/img.jpg"),
        Feed(title: "울산 데이트 코스", thumbnailUrl: "https://www.travelnbike.com/news/photo/201802/53950_72735_2932.jpg"),
        Feed(title: "부산 데이트 코스", thumbnailUrl: "https://festivalskorea.com/wp-content/uploads/2023/03/%EB%B6%81%EC%B4%8C%ED%95%9C%EC%98%A5%EB%A7%88%EC%9D%8401.jpg"),
        Feed(title: "울산 데이트 코스", thumbnailUrl: "https://ak-d.tripcdn.com/images/1i62g223496dyrd75A10E_W_400_0_R5_Q90.jpg?proc=source/trip"),
        Feed(title: "경주 데이트 코스", thumbnailUrl: "https://cdn.3hoursahead.com/v2/content/image-comp/6648077e-3171-4843-bf8a-d9ca4e5ff5de.webp"),
        Feed(title: "함양 데이트 코스", thumbnailUrl: "https://a.cdn-hotels.com/gdcs/production160/d54/bffc8a9b-aa37-4c0f-a4db-708627509e5c.jpg?impolicy=fcrop&w=800&h=533&q=medium"),
        Feed(title: "명동 데이트 코스", thumbnailUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoRb3bcC7BAVU4t0MKQ1Wusj-hyjy-Ybsy0Q&usqp=CAU"),
        Feed(title: "구미 데이트 코스", thumbnailUrl: "https://blogforgift.com/wp-content/uploads/2019/11/%EC%8B%9D%EB%AC%BC%EC%9B%902.jpg"),
        Feed(title: "논산 데이트 코스", thumbnailUrl: "https://assets.deep-exp.com/assets/img/uploads/media/325/main_front_detail.jpg"),
        Feed(title: "예천 데이트 코스", thumbnailUrl: "https://ak-d.tripcdn.com/images/1i6642215cguklv68C637_W_400_0_R5_Q90.jpg?proc=source/trip"),
        Feed(title: "영월 데이트 코스", thumbnailUrl: "https://minatokankoprod.blob.core.windows.net/assets/2022/07/06/02/07/24/01%20DSC_3490-2.jpg"),
        Feed(title: "동대문 데이트 코스", thumbnailUrl: "https://www.travelnbike.com/news/photo/201905/80773_150537_958.jpg"),
        Feed(title: "천안 데이트 코스", thumbnailUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrjjnPTDJ_a5VcsNxBPB6TShQf6coFWrH7Cw&usqp=CAU"),
        Feed(title: "보령 데이트 코스", thumbnailUrl: "https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202309/07/onehomelife/20230907174203751czzw.png"),
        Feed(title: "강남 데이트 코스", thumbnailUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPfq27XqzZJyUbcG3QlTdsO4O9nSdr-tT6wzDWuH1kHqpnKAWxIac7C-eopCw3RGk9Gec&usqp=CAU"),
        Feed(title: "수원 데이트 코스", thumbnailUrl: "https://img4.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202211/09/esquirekorea/20221109180126820tfmc.jpg"),
        Feed(title: "인천 데이트 코스", thumbnailUrl: "https://hng.yna.co.kr/media/content/5617/1571819123470915.png"),
        Feed(title: "동대문 데이트 코스", thumbnailUrl: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202204/07/a027d586-65d6-48f8-9c1d-9ce8e409b9d3.jpg"),
        Feed(title: "동대문 데이트 코스", thumbnailUrl: "https://i.pinimg.com/474x/0f/63/63/0f636303a28a1e028d84cdb28996786f.jpg"),
    ]
    var body: some View {
        ScrollView {
            GeometryReader{proxy -> Color in
                let minY = proxy.frame(in: .named("SCROLL")).minY
                let durationOffset: CGFloat = 35
                DispatchQueue.main.async {
                    
                    if minY < offset {
                        if offset < 0 && -minY > (lastOffset + durationOffset) {
                            // Hide SearcBar and updating last offset
                            withAnimation(.easeOut.speed(1.5)) {
                                hideSearchBar = true
                            }
                            lastOffset = -offset
                        }
                    }
                    if minY > offset && -minY < (lastOffset - durationOffset) {
                        // Hide SearcBar and updating last offset
                        withAnimation(.easeOut.speed(1.5)) {
                            hideSearchBar = false
                        }
                        lastOffset = -offset
                    }
                    
                    self.offset = minY
                }
                return Color.clear
            }
            LazyVGrid(columns: items, spacing:1, content: {
                ForEach(datas) { data in
                    NavigationLink(destination: Text("Detail View")) {
                        AsyncImage(url: URL(string: data.thumbnailUrl))
                            .scaledToFit()
                            .frame(width: width, height: width)
                            .clipped()
                    }
                }
            })
        }
        .coordinateSpace(name: "SCROLL")
    }
}

//#Preview {
//    FeedGridView()
//}
