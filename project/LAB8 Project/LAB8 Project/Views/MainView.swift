//
//  HomeView.swift
//  LAB8 Project
//
//  Created by 이민영 on 2023/11/28.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject var network: Network
    
    var temp: String { String(format: "%.1f", (network.weather.main.temp - 273.15)) }
    var icon: String {network.weather.weather.first?.icon ?? "" }
    
    var body: some View {
        VStack{
            
            // 앱 이름 및 날씨
            HStack{
                Text("앱 이름")
                    .font(.title2)
                
                Spacer()
                
                HStack{
                    Image(systemName: SelectIcon())
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(temp)°")
                        .font(.body)
                        .fontWeight(.bold)
                }
            }
            .padding(30)
            .onAppear{
                network.getWeather()
            }
            

            Grid(alignment: .topLeading){
                GridRow(alignment: .bottom) {
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                        .gridCellColumns(2)
                    CellContent(name: "jongro")
                    CellContent(name: "kangbuk")
                    CellContent(name: "nowon")
                }
                
                GridRow(alignment: .bottom) {
                    CellContent(name: "eunpyeong")
                    CellContent(name: "gwanghwamoon")
                    CellContent(name: "daehakro")
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                        .gridCellColumns(1)
                    CellContent(name: "jungrang")
                }
                
                GridRow(alignment: .bottom) {
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                        .gridCellColumns(1)
                    CellContent(name: "hongdae")
                    CellContent(name: "shinchon")
                    CellContent(name: "junggu")
                    CellContent(name: "ddp")
                }
                
                GridRow(alignment: .bottom) {
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                        .gridCellColumns(1)
                    CellContent(name: "sangsu")
                    CellContent(name: "myeongdong")
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                        .gridCellColumns(1)
                    CellContent(name: "kondae")
                }
                
                
                GridRow(alignment: .bottom) {
                    CellContent(name: "mapho")
                    CellContent(name: "yongsan")
                    CellContent(name: "itaewon")
                    CellContent(name: "sungsu")
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                        .gridCellColumns(1)
                }
                
                GridRow(alignment: .bottom) {
                    CellContent(name: "gangseo")
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                        .gridCellColumns(1)
                    CellContent(name: "dongjak")
                    CellContent(name: "garosugil")
                    CellContent(name: "kangdong")
                    
                }
                
                GridRow(alignment: .bottom) {
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                        .gridCellColumns(1)
                    CellContent(name: "youngdeungpho")
                    CellContent(name: "seocho")
                    CellContent(name: "gangnam")
                    CellContent(name: "songpa")
                    
                }
                
                GridRow(alignment: .bottom) {
                    CellContent(name: "guro")
                    CellContent(name: "gwanak")
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                        .gridCellColumns(1)
                    CellContent(name: "gangnamgu")
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                        .gridCellColumns(1)
                    
                }
                
            }
        }
        
        
        
    }
    
    // 온도 기호
    func SelectIcon () -> String{
        
        if icon == "01d" || icon == "01n" {
            return "sun.max.fill"
        } else if icon == "02d" || icon == "02n" {
            return "cloud.sun.fill"
        } else if icon == "03d" || icon == "03n"{
            return "cloud.fill"
        } else if icon == "04d" || icon == "04n"{
            return "cloud.fill"
        } else if icon == "09d" || icon == "09n"{
            return "cloud.heavyrain.fill"
        } else if icon == "10d" || icon == "10n"{
            return "sun.rain.fill"
        } else if icon == "11d" || icon == "11n"{
            return "cloud.bolt.fill"
        } else if icon == "13d" || icon == "13n"{
            return "cloud.snow.fill"
        } else if icon == "50d" || icon == "50n"{
            return "cloud.fog.fill"
        } else {
            return "sun.horizon.fill"
        }
    }
        
}

struct CellContent: View {
    var name: String
    
    var body: some View {
        
        Button {
                
        } label: {
            Image("\(name)")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 70, maxWidth: .infinity, minHeight: 70 )
                .cornerRadius(8)

        }
    }
}


#Preview {
    MainView().environmentObject(Network())
}



