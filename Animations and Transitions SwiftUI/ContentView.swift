//
//  ContentView.swift
//  Animations and Transitions SwiftUI
//
//  Created by Macbook on 04/09/2022.
//

import SwiftUI

struct ContentView: View {
    //Understanding transitions
    @State private var processing = false
    @State private var completed = false
    @State private var loading = false
    var body: some View {
        Button(action: {
            self.processing.toggle() // Processing Toggle when Press Button.
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 30) // create Shape for Button.
                    .fill(completed ? Color.red : Color.green) // change color based on Completed var State.
                    .frame(width: processing ?  250 : 200, height: 60, alignment: .center) //Change width Based on Processing State.
                    .animation(.easeOut(duration: 2)) //Animate The width with ease out..
            //Code consist of 3 Parts (Before start processing, while processing, After Processing finished)
            // Before Processing
                if !processing {
                    Text("Submit")
                        .font(.system(.title, design: .rounded))
                        .foregroundColor(.white)
                        .transition(.move(edge: .top))
                }
        //-----------------------------------------------------------
        //While Processing
                if processing && !completed {
                    HStack {
                        Circle()
                            .trim(from: 0, to: 0.8)
                            .stroke(Color.white, lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .rotationEffect(Angle(degrees: loading ? 360 : 0))
                            .animation(Animation.easeOut.repeatForever(autoreverses: false))
                        Text("Processing")
                            .font(.system(.title, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .transition(.opacity)
                    .onAppear(){
                        self.startProcessing()
                    }
                }
        //----------------------------------------------------------
        //After Processing Finished...
                if completed {
                    Text("Done")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .onAppear(){
                            self.endProcessing()
                        }
                }
            }
        //---------------------------------------------------------------
            .animation(.spring()) // Animation for zStack...
        })
   }
    private func startProcessing() {
        self.loading = true
        // Simulate an operation by using DispatchQueue.main.asyncAfter
        // In a real world project, you will perform a task here.
        // When the task finishes, you set the completed status to true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.completed = true
        }
    }

    private func endProcessing() {
        // Reset the button's state
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.processing = false
            self.completed = false
            self.loading = false
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

