//
//  FIlterView.swift
//  LAB8 Project
//
//  Created by 박선구 on 11/28/23.
//

import SwiftUI

struct FIlterView: View {
    
    @State var all : Bool = true
    @State var play : Bool = false
    @State var eat : Bool = false
    @State var cafe : Bool = false
    @State var one : Bool = false
    @State var two : Bool = false
    @State var three : Bool = false
    @State var nothing : Bool = true
    @State var inside : Bool = false
    @State var outside : Bool = false
    @State var weather : Bool = false
    
    @State var check : Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            
            VStack(alignment: .leading){
            
            VStack(alignment: .leading) {
                //                Spacer()
                Text("필터 검색")
                    .font(.title3)
                    .fontWeight(.bold)
                //                    .frame(width: 250)
            }
            .padding(.top, 50)
            
            Divider()
                .frame(height: 2)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.5))
            
                VStack(alignment: .leading) {
                    // 목적
                    VStack(alignment: .leading){
                        //            VStack{
                        
                        VStack(alignment: .leading) { // 필터
                            Text("목적")
                                .fontWeight(.bold)
                        }
                        
                        // 목적 버튼
                        HStack{ // 전체, 놀거리
                            Button(action: alltrue, label: {
                                Text("전체")
                                    .foregroundStyle(all == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                //                        .cornerRadius()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(all == true ? .F_9688_D : .gray)
                                    )
                            })
                            
                            
                            Button(action: playtrue, label: {
                                Text("놀거리")
                                    .foregroundStyle(play == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(play == true ? .F_9688_D : .gray)
                                    )
                            })
                            
                            
                            Button(action: eattrue, label: {
                                Text("맛집")
                                    .foregroundStyle(eat == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(eat == true ? .F_9688_D : .gray)
                                    )
                            })
                            
                            
                            Button(action: cafetrue, label: {
                                Text("카페")
                                    .foregroundStyle(cafe == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(cafe == true ? .F_9688_D : .gray)
                                    )
                            })
                            
                        }
                    }
                    //            .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    
                    
                    // 가격
                    VStack(alignment: .leading){
                        //            VStack{
                        
                        VStack(alignment: .leading) { // 가격
                            Text("가격대")
                                .fontWeight(.bold)
                        }
                        
                        
                        // 가격 버튼
                        HStack{ // 1만원, 2만원
                            Button(action: nothingtrue, label: {
                                Text("상관없음")
                                    .foregroundStyle(nothing == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(nothing == true ? .F_9688_D : .gray)
                                    )
                            })
                            
                            Button(action: onetrue, label: {
                                Text("1만이하")
                                    .foregroundStyle(one == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(one == true ? .F_9688_D : .gray)
                                    )
                            })
                            
                            Button(action: twotrue, label: {
                                Text("3만이하")
                                    .foregroundStyle(two == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(two == true ? .F_9688_D : .gray)
                                    )
                            })
                            
                            Button(action: threetrue, label: {
                                Text("5만이하")
                                    .foregroundStyle(three == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(three == true ? .F_9688_D : .gray)
                                    )
                            })
                        }
                    }
                    //            .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    
                    // 장소
                    VStack(alignment: .leading){
                        //            VStack{
                        
                        VStack(alignment: .leading) { // 장소
                            Text("장소")
                                .fontWeight(.bold)
                        }
                        
                        // 장소 버튼
                        HStack{ // 실내
                            Button(action: insidetrue, label: {
                                Text("실내")
                                    .foregroundStyle(inside == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(inside == true ? .F_9688_D : .gray)
                                    )
                            })
                            
                            Button(action: outsidetrue, label: {
                                Text("실외")
                                    .foregroundStyle(outside == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(outside == true ? .F_9688_D : .gray)
                                    )
                            })
                            
                            Button(action: weathertrue, label: {
                                Text("날씨추천")
                                    .foregroundStyle(weather == true ? .F_9688_D : .black)
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(weather == true ? .F_9688_D : .gray)
                                    )
                            })
                        }
                    }
                    //            .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                }
                
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            
            // 확인 버튼
            Button(action: {}, label: {
                
                Text("결과보기")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.F_9688_D)
                
            })
            .cornerRadius(10)
            
            
        }
        .padding(.horizontal, 20)
   //            .padding()
           
//            .padding(.horizontal, 20)
//            .padding()
        
    }
    
    func alltrue() {
        if all == false {
            all = true
            play = false
            eat = false
            cafe = false
        }
    }
    
    func playtrue() {
        if play == false {
            all = false
            play = true
        } else if eat == false && cafe == false {
            all = true
            play = false
        } else {
//            all = true
            play = false
        }
    }
    
    func eattrue() {
        if eat == false {
            all = false
            eat = true
        } else if play == false && cafe == false {
            all = true
            eat = false
        } else {
//            all = true
            eat = false
        }
    }
    
    func cafetrue() {
        if cafe == false {
            all = false
            cafe = true
        } else if eat == false && play == false {
            all = true
            cafe = false
        } else {
//            all = true
            cafe = false
        }
    }
    
    func onetrue() {
        if one == false {
            nothing = false
            one = true
            two = false
            three = false
        } else {
            nothing = true
            one = false
        }
    }
    
    func twotrue() {
        if two == false{
            nothing = false
            one = false
            two = true
            three = false
        } else {
            nothing = true
            two = false
        }
    }
    
    func threetrue() {
        if three == false{
            nothing = false
            one = false
            two = false
            three = true
        } else {
            nothing = true
            three = false
        }
    }
    
    func nothingtrue() {
        if nothing == false{
            nothing = true
            one = false
            two = false
            three = false
        }
    }
    
    func insidetrue() {
        if inside == false{
            inside = true
        } else {
            inside = false
        }
    }
    
    func outsidetrue() {
        if outside == false{
            outside = true
        } else {
            outside = false
        }
    }
    
    func weathertrue() {
        if weather == false{
            weather = true
        } else {
            weather = false
        }
    }
    
    func allCheck() {
        if check == false {
            
            check = true
            
        } else {
            check = false
        }
    }
}
    

#Preview {
    FIlterView()
}
