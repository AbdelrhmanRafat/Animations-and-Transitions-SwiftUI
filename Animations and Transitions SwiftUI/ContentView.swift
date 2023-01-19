//
//  ContentView.swift
//  Animations and Transitions SwiftUI
//
//  Created by Macbook on 04/09/2022.
//

import SwiftUI

struct ContentView: View {
    //Understanding transitions
    @State private var show = false
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300, alignment: .center)
                .foregroundColor(.green)
                .overlay(
                Text("Show Details")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                )
            if show {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300, alignment: .center)
                .foregroundColor(.purple)
                .overlay(
                Text("Well Here's the details")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                )
                // Extend Any Transition
                .transition(.ScaleAndOffset)
           }
       }
        .onTapGesture {
            withAnimation(Animation.spring()){
                self.show.toggle()
            }
        }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
    static var offsetScaleOpacity : AnyTransition {
        //You can combine two or more transitions together by calling the combined (with : ) method.
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
    //Symmatric Transition Means that the insertion and removal of the view has the same transition Asymmetric Transition detrmine transition for removal and insertion.
    static var ScaleAndOffset : AnyTransition {
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0))
    }
}
