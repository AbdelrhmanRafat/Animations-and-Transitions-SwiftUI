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
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        .onTapGesture { // On Tap Gesture could be attached to any view make it Tappable
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)){ // Damping Effect.
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
                self.heartSizeChanged.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
