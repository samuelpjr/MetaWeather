//
//  Search.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import SwiftUI

struct Search: View {
    @State private var cityName: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Enter the city name:")
                .multilineTextAlignment(.leading)
                .padding(.leading)
                
            TextField("City Name", text: $cityName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading, .trailing])
                
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
