//
//  ContentView.swift
//  Animations and Transitions SwiftUI
//
//  Created by Macbook on 04/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var recordBegin = false
    @State private var recording = false
    //Transforming Rectangle into Circle.
    var body: some View {
        ZStack {
            // Rounded Rectangle Transfer to circle..When the corner redius be equal to half of Frame Width..
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5) // Corner Redius is 5 at the begin for Rectangle
                .frame(width: recordBegin ? 60 : 250, height: 60, alignment: .center) // Rectangle redius is 250 at the begin
                .foregroundColor(recordBegin ? .red : .green) // Rectangle color is green at the begin.
            RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                .trim(from: 0, to: recordBegin ? 0 : 1)
                .stroke(lineWidth: 5)
                    .frame(width: recordBegin ? 70 : 260, height: 70, alignment: .center)
            .foregroundColor(.green)
            .overlay(
                Image(systemName: "mic.fill") // Over Lay Mic Image on Rectangle
                    .font(.system(.title))
                    .foregroundColor(.white)
                    .scaleEffect(recording ? 0.7 : 1) // Mic Scale Changed between 0.7 and 1 with spring Animation..
                )
        }
        .onTapGesture {
            withAnimation(Animation.spring()){
                self.recordBegin.toggle()
            }
            withAnimation(Animation.spring().repeatForever().delay(0.5)){ // Delay Used to show spring animation for mic after transfer from rectangle to circle done
                self.recording.toggle()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

