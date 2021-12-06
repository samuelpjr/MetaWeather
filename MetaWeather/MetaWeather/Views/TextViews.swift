//
//  TextViews.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import SwiftUI

struct DegreesText: View {
    var text: String
    
    var body: some View {
        Text(String(text))
            .kerning(-2.0)
            .foregroundColor(Color("TextColor"))
            .font(Font.system(size:85, design: .default))
            .fontWeight(.thin)
    }
}

struct CityText: View {
    var text: String
    
    var body: some View {
        Text(String(text).uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.largeTitle)
            
    }
}

struct WeatherStateText: View {
    var text: String
    
    var body: some View {
        Text(String(text))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title)
    }
}


struct MaxAndMinText: View {
    var text: String
    
    var body: some View {
        Text(String(text))
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            VStack{
                DegreesText(text: "2°")
                CityText(text: "Kitchener")
                WeatherStateText(text: "Cluding")
                MaxAndMinText(text:"Max: 3°")
            }
        }.background(Color("BackgroundContainer"))
        
    }
}
