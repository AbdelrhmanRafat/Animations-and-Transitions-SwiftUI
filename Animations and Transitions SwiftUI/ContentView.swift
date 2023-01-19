//
//  ContentView.swift
//  Animations and Transitions SwiftUI
//
//  Created by Macbook on 04/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    //Loading Indicator Using Rounded Rectangular.
    var body: some View {
        ZStack {
            Text("Loading")
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
                .offset(x: 0, y: -25)
              RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5),lineWidth: 3)
                .frame(width: 250, height: 3, alignment: .center)
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.green,lineWidth: 3)
                .frame(width: 30, height: 3, alignment: .center)
                .offset(x: isLoading ? 110 : -100, y: 0)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
        }
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
