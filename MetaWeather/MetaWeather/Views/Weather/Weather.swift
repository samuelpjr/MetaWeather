//
//  Weather.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import SwiftUI

struct Weather: View {
    
    var city: String
    var currentDegree: String
    var weather: String
    var max: String
    var min: String
    
    var body: some View {
        VStack(spacing: 10) {
            CityText(text: city)
            DegreesText(text: "\(currentDegree)°")
            WeatherStateText(text:weather)
            HStack {
                MaxAndMinText(text:"Max: \(max)°")
                MaxAndMinText(text:"Min: \(min)°")
            }
        }
    }
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        Weather(city: "London", currentDegree: "2", weather: "Claud", max: "4", min: "1").background(.blue)
    }
}
