//
//  HomeView.swift
//  LAB8 Project
//
//  Created by 박선구 on 11/28/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var network: Network
    
    var temp: String { String(format: "%.1f", (network.weather.main.temp - 273.15)) }
    var icon: String {network.weather.weather.first?.icon ?? "" }
    
    var body: some View {
            VStack{
                
                // 앱 이름 및 날씨
                HStack{
                    Text("앱 이름")
                        .font(.largeTitle)
                    
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
                
                // 홈 화면
                ScrollView{
                    
                    Text("Home").font(.largeTitle)

                }
                .background(Color.white)

                
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

#Preview {
    HomeView()
        .environmentObject(Network())
}
