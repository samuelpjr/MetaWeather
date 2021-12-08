//
//  ErrorView.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 07/12/21.
//

import SwiftUI

struct ErrorView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Icon(name: "xmark.circle", color: .red)
                    .padding()
            }
            
            Text("Ops...")
                .padding([.top], 100)
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding()
        }
        Spacer()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
