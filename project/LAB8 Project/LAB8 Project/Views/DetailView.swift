//
//  DetailView.swift
//  LAB8 Project
//
//  Created by 윤준성 on 11/28/23.
//

import SwiftUI

struct DetailView: View {
    @State private var showSheet = true
    
    var body: some View {
        ZStack {
            VStack {
                Image("shin")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                

                .sheet(isPresented: $showSheet) {
                    ModalView()
                        .foregroundColor(.black)
                        .presentationDetents([.fraction(0.6), .large])
                        .presentationCornerRadius(50)
                        .interactiveDismissDisabled()
                }
            }
        }
    }
}

struct ModalView: View {
    var body: some View {
            NavigationView {
                VStack {
                    Text("주소")
                    Text("평점")
                    Text("리뷰")
                        .navigationTitle(Text("Name"))
            }
        }
    }
}

#Preview {
    DetailView()
}
