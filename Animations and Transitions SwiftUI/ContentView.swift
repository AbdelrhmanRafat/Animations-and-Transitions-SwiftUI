//
//  ContentView.swift
//  Animations and Transitions SwiftUI
//
//  Created by Macbook on 04/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    //Loading Indicator Using Rotation Effect.
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.7)
            .stroke(Color.green,lineWidth: 5)
            .frame(width: 100, height: 100, alignment: .center)
            .rotationEffect(Angle(degrees: isLoading ? 360.0 : 0.0))// Two States that the Loading status will control.
            //Repeat Forever Repeat Animation again and again.
            .animation(Animation.default.repeatForever(autoreverses: false))
            .onAppear(){
                self.isLoading = true
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
