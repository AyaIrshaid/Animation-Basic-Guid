//
//  ContentView.swift
//  AnimationBasicGuid
//
//  Created by Aya Irshaid on 22/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isMovedRight = false
    @State private var isHueRotate = false
    @State private var isOpaque = true
    @State private var isScaled = false
    @State private var isTrimmed = false
    @State private var circleTrim: CGFloat = 1.0
    @State private var scaleOne = 1.0
    
    var body: some View {
        //        List {
        ScrollView {
            VStack {
                //MARK: - Start an animation immediately after a view appears
                Circle()
                    .frame(width: 57, height: 75)
                    .scaleEffect(scaleOne)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 2)
                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                        withAnimation(repeated){ //(baseAnimation) {
                            scaleOne = 0.5
                        }
                    }
                //MARK: - ANIMATE OFFSET
                Button {
                    isMovedRight.toggle()
                } label: {
                    Text("ANIMATE OFFSET")
                }
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 75, height: 75)
                    .offset(x: isMovedRight ? 150 : 0, y: 0)
                    .animation(.default, value: isMovedRight)
                Divider().background(Color.black)
                
                //MARK: - ANIMATE HUE ROTATION (Colors)
                Button {
                    isHueRotate.toggle()
                } label: {
                    Text("ANIMATE HUE ROTATION")
                }
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 75, height: 75)
                    .hueRotation(Angle.degrees(isHueRotate ? 180 : 0))
                    .animation(.easeInOut(duration: 1), value: isHueRotate)
                
                //MARK: - ANIMATE HUE WITH GRADIENT
                AngularGradient(gradient: Gradient(colors: [.red, Color.blue]), center: .center)
                    .hueRotation(Angle.degrees(isHueRotate ? 360 : 0))
                    .animation(.easeInOut(duration: 2), value: isHueRotate)
                    .mask(Circle())
                    .frame(width: 75, height: 75)
                Divider().background(Color.black)
                
                //MARK: - ANIMATE OPACITY
                Button {
                    isOpaque.toggle()
                } label: {
                    Text("ANIMATE OPACITY")
                }
                Circle()
                    .frame(height: 75)
                    .foregroundColor(.purple)
                    .opacity(isOpaque ? 1 : 0.18)
                    .animation(.easeIn, value: isOpaque)
                Divider().background(Color.black)
                
                //MARK: - ANIMATE THE SCALE OF A CIRCLE SHAPE
                Button {
                    isScaled.toggle()
                } label: {
                    Text("ANIMATE SCALE")
                }
                Circle()
                    .frame(height: 75)
                    .foregroundColor(.purple)
                    .scaleEffect(isScaled ? 0.7 : 1, anchor: .bottomTrailing) // anchor is optional
                    .animation(.default, value: isScaled)
                Divider().background(Color.black)
                
                //MARK: - ANIMATE THE TRIM MODIFIER OF A CIRCLE
                Button {
                    isTrimmed.toggle()
                    circleTrim = isTrimmed ? 0.25 : 1.0
                } label: {
                    Text("ANIMATE THE TRIM")
                }
                
                Rectangle()
                    .cornerRadius(isTrimmed ? 15 : 40)
                    .frame(width: 75, height: 75)
                    .animation(.default, value: isTrimmed)
                
                Circle()
                    .trim(from: 0, to: circleTrim)
                    .stroke(.red, style: StrokeStyle(lineWidth: isTrimmed ? 5 : 10, lineCap: .round))
                    .rotationEffect(.degrees(180))
                    .frame(width: 75, height: 75)
                .animation(.default, value: isTrimmed)            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

