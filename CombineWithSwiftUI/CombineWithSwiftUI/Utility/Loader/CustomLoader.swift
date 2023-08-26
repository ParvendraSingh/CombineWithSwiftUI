//
//  CustomLoader.swift
//  CombineWithSwiftUI
//
//  Created by Parvendra Kumar on 25/08/23.
//

import SwiftUI


struct CustomLoader: View {
    @State var animate = false
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.8).stroke(AngularGradient(gradient: .init(colors: [.red,.orange]), center: .center), style: StrokeStyle(lineWidth: 8,lineCap: .round))
                .frame(width: 50, height: 50)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0 ))
                .animation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false))
            
            Text("Loading...").padding(.top)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(15)
        .onAppear {
            self.animate.toggle()
        }
    }
}
