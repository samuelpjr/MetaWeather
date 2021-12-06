//
//  SearchingIcon.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import SwiftUI


struct SearchingIcon: View {
  var systemName: String

    var body: some View {
        HStack() {
            Image(systemName: systemName)
                .font(.title)
                .foregroundColor(Color("TextColor"))
                .frame(width: CGFloat(56.0), height: CGFloat(56.0))
                .overlay(
                    Circle()
                        .strokeBorder(Color("TextColor"), lineWidth: CGFloat(2.0))
                )
                .padding(.leading)
            Spacer()
        }
    }
}

struct SearchingIcon_Previews: PreviewProvider {
    static var previews: some View {
        SearchingIcon(systemName: "magnifyingglass")
    }
}
