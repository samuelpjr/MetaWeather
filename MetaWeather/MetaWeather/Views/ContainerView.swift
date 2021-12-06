//
//  SwiftUIView.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import SwiftUI

struct ContainerView: View {
    @State private var searchingButton = true
    var image: UIImage
    var city: String
    var currentDegree: String
    var weather: String
    var max: String
    var min: String
    
    var body: some View {
        VStack {
            if searchingButton {
                SearchingIcon(systemName: "magnifyingglass")
            } else {
                Search()
            }
            Weather(city: city, currentDegree: currentDegree, weather: weather, max: max, min: min)
                .padding()
            ContainerWeadherImage(image: image)
                .padding()
            Spacer()
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView(
            image: UIImage(),
            city: "Kitchener",
            currentDegree: "2",
            weather: "Claud",
            max: "10",
            min: "-4")
            .background(Color("BackgroundContainer"))
        ContainerView(
            image: UIImage(),
            city: "Kitchener",
            currentDegree: "2",
            weather: "Claud",
            max: "10",
            min: "-4").background(Color("BackgroundContainer"))
            .preferredColorScheme(.dark)
    }
}
