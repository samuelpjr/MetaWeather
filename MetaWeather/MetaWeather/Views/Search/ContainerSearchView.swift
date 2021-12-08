//
//  SwiftUIView.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import SwiftUI

struct ContainerSearchView: View {
    var body: some View {
        VStack {
            SearchView(cityName: "")
                .padding([.top], 150)
                .padding([.trailing], 20)
                
            Spacer()
        }
    }
}

struct ContainerSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerSearchView()
            .background(Color("BackgroundContainer"))
        ContainerSearchView()
            .background(Color("BackgroundContainer"))
            .preferredColorScheme(.dark)
    }
}
