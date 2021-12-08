//
//  Search.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import SwiftUI

struct Search: View {
    @Binding var cityName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            SearchText(text: "Enter the city name:")
                .multilineTextAlignment(.leading)
                .padding(.leading)
                
            TextField("City Name", text: $cityName)
                .frame(height: 40)
                .background(.white)
                .cornerRadius(5)
                .opacity(1.0)
                .foregroundColor(.black)
                .padding([.leading, .trailing])
            
        }
    }
}

struct Search_Previews: PreviewProvider {
    
    static var previews: some View {
        Search(cityName: .constant(""))
            .background(Color("BackgroundContainer"))
        
        Search(cityName: .constant(""))
            .background(Color("BackgroundContainer"))
            .preferredColorScheme(.dark)
            
    }
}
