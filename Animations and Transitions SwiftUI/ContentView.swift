//
//  ContentView.swift
//  Animations and Transitions SwiftUI
//
//  Created by Macbook on 04/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    //Dot Loading Indicator.
    var body: some View {
        HStack {
            ForEach(0...4, id : \.self) {
                index in
                Circle()
                    .fill(Color.green)
                    .frame(width: 10, height: 100, alignment: .center)
                    .scaleEffect(self.isLoading ? 0 : 1)
                    .animation(Animation.linear(duration: 0.6).repeatForever().delay(Double(index)))
            }
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
