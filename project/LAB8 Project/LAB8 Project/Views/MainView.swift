//
//  HomeView.swift
//  LAB8 Project
//
//  Created by 이민영 on 2023/11/28.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject var network: Network
    @State var selectedTab = 0
    
    var temp: String { String(format: "%.1f", (network.weather.main.temp - 273.15)) }
    var icon: String {network.weather.weather.first?.icon ?? "" }
    
    
    var body: some View {
        VStack{
            
            // 앱 이름 및 날씨
            HStack{
                Text("알뜰남녀")
                    .font(.title2)
                
                Spacer()
                
                HStack{
                    Image(systemName: SelectIcon())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 30)
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
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            
            TabView(selectedTab: selectedTab)
            
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

struct TabView: View{
    
    var selectedTab: Int
    
    var body: some View {
        
        ZStack{
            HStack{
                ForEach((TabbedItem.allCases), id: \.self){ item in
                    Button{
                        $selectedTab = item.rawValue
                    } label: {
                        CustomTabItem(imageName: item.iconName, isActive: (selectedTab == item.rawValue))
                    }
                }
            }
        }
        
        .background(Color(UIColor(hexCode: "#FDF0F0")))
    }
    
}


extension MainView{
    func CustomTabItem(imageName: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
                .frame(width: 30)
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .padding(10)
                .background(isActive ? Color(UIColor(hexCode: "#F9688D")): .clear)
                .foregroundStyle(isActive ? .white : .gray)
                
                .cornerRadius(20.0)
                .frame(width: isActive ? 40 : 50, height: isActive ? 40 : 50)
            Spacer()
                .frame(width: 20)
        }
        .frame(width: 100, height: 60)

    }

}

extension UIColor {
    
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}



#Preview {
    MainView().environmentObject(Network())
}



