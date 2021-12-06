//
//  ContainerWeadherImage.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import SwiftUI

struct ContainerWeadherImage: View {
    var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 250.0, height: 250.0)
    }
}

struct ContainerWeadherImage_Previews: PreviewProvider {
    static var previews: some View {
        ContainerWeadherImage(image: UIImage())
    }
}
