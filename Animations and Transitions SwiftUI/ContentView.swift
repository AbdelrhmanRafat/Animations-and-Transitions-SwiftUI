//
//  ContentView.swift
//  Animations and Transitions SwiftUI
//
//  Created by Macbook on 04/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    //You Define Two State of view and swiftUI Will figure out the rest.
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(circleColorChanged ? Color(.systemGray) : .red)
                .animation(.default)// Built in Animation.
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
                .animation(.default)
        }
        .onTapGesture {
            self.circleColorChanged.toggle()
            self.heartColorChanged.toggle()
            self.heartSizeChanged.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
