//
//  ContainerWeatherView.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 07/12/21.
//

import SwiftUI

struct ContainerWeatherView: View {
    @Environment(\.presentationMode) var presentationMode
    var data: WeatherModel
    
    
    var body: some View {
        ZStack{
            Color("BackgroundContainer")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Icon(name: "magnifyingglass")
                }
                .padding()
                
                Weather(city: data.city, currentDegree: data.currentDegree, weather: data.weather, max: data.max, min: data.min)
                    .padding()
                WeadherImage(image: data.image)
                    .padding()
                Spacer()
            }
        }
    }
}

