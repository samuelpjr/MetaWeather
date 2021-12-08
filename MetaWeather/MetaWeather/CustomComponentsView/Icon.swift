//
//  SearchingIcon.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import SwiftUI


struct Icon: View {
    var name: String = "magnifyingglass"
    var color: Color = Color("TextColor")
    
    var body: some View {
        HStack() {
            Spacer()
            Image(systemName: name)
                .font(.title)
                .foregroundColor(color)
                .frame(width: CGFloat(56.0), height: CGFloat(56.0))
                .overlay(
                    Circle()
                        .strokeBorder(Color("TextColor"), lineWidth: CGFloat(2.0))
                )
                .padding(.leading)
        }
    }
}

struct SearchingIcon_Previews: PreviewProvider {
    static var previews: some View {
        Icon(name: "magnifyingglass")
    }
}
