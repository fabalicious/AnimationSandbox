//
//  EchoTangoLogo.swift
//  AnimationSandbox
//
//  Created by Fabian Knecht on 22.11.2024.
//

import SwiftUI


struct EchoColor2: View {
    @State private var offsetY: CGFloat = 0 // Vertical offset
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 120, height: 120)
                .foregroundColor(ETColourScheme.lavender)
                .mask( // Apply the mask here
                    Circle()
                        .frame(width: 120, height: 120) // Circle defining the mask area
                )
            Rectangle()
                .frame(width: 120, height: 120)
                .offset(y: offsetY)
                .foregroundColor(ETColourScheme.lime)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) { // Animate the vertical movement
                        offsetY = offsetY == 0 ? 120 : 0 // Toggle position
                    }
                }
                .frame(width: 120, height: 120) // Frame for the ZStack
                .mask( // Apply the mask here
                    Circle()
                        .frame(width: 120, height: 120) // Circle defining the mask area
                )
        }
        .clipped() // Ensures the content doesn't overflow
    }
}

struct EchoColor: View {
    @State private var offsetY: CGFloat = 0 // Vertical offset
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 120, height: 120)
                .foregroundColor(ETColourScheme.lavender)
                .mask( // Apply the mask here
                    Circle()
                        .frame(width: 120, height: 120) // Circle defining the mask area
                )
            Rectangle()
                .frame(width: 120, height: 120)
                .offset(y: offsetY)
                .foregroundColor(ETColourScheme.lime)
                .onAppear() {
                    withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) { // Animate the vertical movement
                        offsetY = offsetY == 0 ? 200 : 0 // Toggle position
                    }
                }
                .frame(width: 120, height: 120) // Frame for the ZStack
                .mask( // Apply the mask here
                    Circle()
                        .frame(width: 120, height: 120) // Circle defining the mask area
                )
        }
        .clipped() // Ensures the content doesn't overflow
    }
}

struct EchoToTango: View {
    var body: some View {
        VStack{
            HStack(spacing: 10) {
                EchoLeft()
//                EchoBar()
//                    .padding(0)
                EchoRight()
            }
            HStack{
                EchoZoom()
                Rectangle()
                    .frame(width:120, height:120)
                    .opacity(0)
            }
            .padding(15)
            EchoColor()
            }
           .padding(15)
        }
}

struct EchoBar: View {
    let color = ETColourScheme.lime
    @State var w = 0.0
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(width: w, height: 25)
                .foregroundColor(color)
            Rectangle()
                .frame(width: w, height: 70)
                .foregroundColor(.white)
                .onAppear() {
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.5)) {
                        w = 120
                    }
                }
            Rectangle()
                .frame(width: w, height: 25)
                .foregroundColor(color)
        }
        .padding(0)
        }
}

struct EchoLeft: View {
    var body: some View {
        ZStack{
                Circle()
                    .trim(from: 0.25, to: 0.75)
                    .foregroundColor(ETColourScheme.lime)
                    .frame(width: 120, height: 120)
                    .offset(x: 65, y: 0)
        Circle()
            .trim(from: 0.25, to: 0.75)
            .foregroundColor(.white)
            .frame(width: 70, height: 70)
            .offset(x: 65, y: 0)
        }
       }
}

struct EchoRight: View {
    var body: some View {
        ZStack{
                Circle()
                    .trim(from: 0.25, to: 0.75)
                    .rotationEffect(.degrees(-180))
                    .foregroundColor(ETColourScheme.lime)
                    .frame(width: 120, height: 120)
                    .offset(x: -65, y: 0)
            Circle()
                .trim(from: 0.25, to: 0.75)
                .rotationEffect(.degrees(-180))
                .foregroundColor(.white)
                .frame(width: 70, height: 70)
                .offset(x: -65, y: 0)
        }
    }
}

struct EchoCircle: View {
    var body: some View {
                Circle()
                    .strokeBorder(ETColourScheme.lavender, lineWidth: 25)
                    .frame(width: 120, height: 120)
        }
}


struct EchoZoom: View {
   @State private var isScaled = false

    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 60)
            .foregroundColor(ETColourScheme.lime)
            .frame(width: 120, height: 120)
        RoundedRectangle(cornerRadius: 35)
            .foregroundColor(.white)
            .frame(width: 70, height: 70)
    }
                .scaleEffect(isScaled ? 2.0 : 1.0) // Scale up or down based on state
                .animation(.easeInOut, value: isScaled) // Implicit animation
                .onTapGesture {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Delay by 0.5 seconds
                        isScaled.toggle()
                    }
                }
        }
    }


struct EchoOverlap: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 60)
                .foregroundColor(ETColourScheme.lime)
                .frame(width: 120, height: 120)
            RoundedRectangle(cornerRadius: 35)
                .foregroundColor(.white)
                .frame(width: 70, height: 70)
        }
    }
}

struct Echo: View {
    var body: some View {
                RoundedRectangle(cornerRadius: 60)
                    .strokeBorder(ETColourScheme.lime, lineWidth: 30)
                    .frame(width: 120, height: 120)
        }
}

struct Tango: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 60)
            .strokeBorder(ETColourScheme.lavender, lineWidth: 25)
            .frame(width: 240, height: 120)
        }
}

struct EchoToTango_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            //EchoBar()
            //EchoToTango()
            EchoColor2()
        }

    }
}


