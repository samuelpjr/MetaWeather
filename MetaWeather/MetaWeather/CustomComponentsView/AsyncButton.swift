//
//  GaugeProgressStyle.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 07/12/21.
//

import SwiftUI

struct AsyncButton<Content: View>: View {
    
    var isComplete: Bool
    let action: ()->()
    let content: Content
    
    @Binding var inProgress: Bool
    
    init(isComplete: Bool, inProgress: Binding<Bool> , action: @escaping ()->(), @ViewBuilder label: ()->Content) {
        self.action = action
        self.isComplete = isComplete
        self.content = label()
        self._inProgress = inProgress
    }
    
    var body: some View {
        Button(action: {
            if !inProgress { action() }
            withAnimation(Animation.easeInOut(duration: 0.4)) {
                inProgress = true
            }

        }, label: {
            VStack(alignment: .trailing) {
                if inProgress && !isComplete {
                    ProgressView()
                        .foregroundColor(.white)
                } else if isComplete {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .center)
                        .foregroundColor(.white)
                } else {
                    content
                }
            }
            .frame(maxWidth: isComplete || inProgress ? 50 : .infinity, maxHeight: isComplete  || inProgress ? 50 : nil, alignment: .center)
            .padding(.vertical, isComplete  || inProgress ? 0 : 12)
            .foregroundColor(.white)
            .background(
                ZStack {
                    Color("BackgroundContainer")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.clear]),
                                   startPoint: .top, endPoint: .bottom)
                }
            )
            .cornerRadius(isComplete || inProgress ? 25 : 8)
            .font(Font.body.weight(.semibold))
            .padding(.all, 20)
        })
    }
}
