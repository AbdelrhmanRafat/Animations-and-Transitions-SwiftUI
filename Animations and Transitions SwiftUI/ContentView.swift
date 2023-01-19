//
//  ContentView.swift
//  Animations and Transitions SwiftUI
//
//  Created by Macbook on 04/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var progress : CGFloat = 0.0
    @State private var isLoading = false
    //Progress Indicator
    var body: some View {
        ZStack {
            Text("\(Int(progress * 100))%")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            Circle()
                .stroke(Color(.systemGray5),lineWidth: 10)
                .frame(width: 150, height: 150, alignment: .center)
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(Color.green,lineWidth: 10)
                .frame(width: 150, height: 150, alignment: .center)
                .rotationEffect(Angle(degrees: -90))
        }
        .onAppear(){
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                self.progress += 0.05
                if self.progress >= 1.0 {
                    timer.invalidate() // Stops the timer.
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
