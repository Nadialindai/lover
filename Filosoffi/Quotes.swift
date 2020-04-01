//
//  Quotes.swift
//  Filosoffi
//
//  Created by Nadia Leung on 3/30/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

var recordingSession: AVAudioSession!
var audioRecorder: AVAudioRecorder!

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)

    static let darkStart = Color(#colorLiteral(red: 0.7626122832, green: 0.8218374252, blue: 0.9257722497, alpha: 1))
    static let darkEnd = Color(#colorLiteral(red: 0.7072226787, green: 0.7262267746, blue: 0.7832390623, alpha: 1))

    static let lightStart = Color(#colorLiteral(red: 0.90865165, green: 0.9402189255, blue: 1, alpha: 1))
    static let lightEnd = Color(#colorLiteral(red: 0.5362607011, green: 0.5659457814, blue: 0.6380989143, alpha: 1))
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                        )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                        )
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
        )
    }
}

struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .overlay(shape.stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .overlay(shape.stroke(Color.darkEnd, lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.lightEnd, Color.lightStart))
                    .overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: Circle())
        )
            .animation(nil)
    }
}

struct ColorfulButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                ColorfulBackground(isHighlighted: configuration.isPressed, shape: Circle())
        )
            .animation(nil)
    }
}

struct DarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {

            configuration.isOn.toggle()

        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            DarkBackground(isHighlighted: configuration.isOn, shape: Circle())
        )
    }
}

struct ColorfulToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {

        Button(action: {
            playMusic()
            configuration.isOn.toggle()

        }) {
            
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            ColorfulBackground(isHighlighted: configuration.isOn, shape: Circle())
        )
    }
}

struct Greeting {
    var id = UUID()
    var hi: String
}



struct ContentView: View {
    @State private var isToggled = false
//[Greeting(hi: "Hi"), Greeting(hi: "Bonjour"), Greeting(hi: "Ciao")"]
    @State private var textValue: Int = 0
    var audioPlayer = AVAudioPlayer()


    var verses = ["Remember me with favor, O my God. - Nehemiah 13", "Shall we accept good from God, and not trouble? -Job 1:10"]

   var body: some View {

        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)


            VStack(spacing: CGFloat(40)) {

                if textValue % 2 == 0 {
                    Text("\(textValue)").foregroundColor(Color(#colorLiteral(red: 0.7626122832, green: 0.8218374252, blue: 0.9257722497, alpha: 1))).font(.largeTitle).transition(.opacity) .font(.system(size:20, weight: .semibold, design: .rounded))
                    .frame(width: 330, height: 400)
                        .background(
                            ZStack{
                                Color(#colorLiteral(red: 0.9087617397, green: 0.9362817407, blue: 0.9985759854, alpha: 1))

                                RoundedRectangle(cornerRadius:16, style: .continuous)
                                    .foregroundColor(.white)
                                    .blur(radius: 4)
                                    .offset(x: -8, y: -8)
                                RoundedRectangle(cornerRadius:16, style: .continuous)
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8891553283, green: 0.9166718125, blue: 0.9789679646, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                    .padding(2)
                                    .blur(radius: 2)
                            }
                    )
                        .clipShape(RoundedRectangle(cornerRadius:16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.7626122832, green: 0.8218374252, blue: 0.9257722497, alpha: 1)), radius: 20, x: 20, y: 20)
                        .shadow(color: Color(#colorLiteral(red: 0.9958658814, green: 1, blue: 0.9999271035, alpha: 1)), radius: 20, x: -20, y: -20)

                }
                if textValue % 2 == 1 {
                    Text("\(textValue)").foregroundColor(Color(#colorLiteral(red: 0.7626122832, green: 0.8218374252, blue: 0.9257722497, alpha: 1))).font(.largeTitle).transition(.opacity)
                        .font(.system(size:20, weight: .semibold, design: .rounded))
                        .frame(width: 330, height: 400)
                        .background(
                            ZStack{
                                Color(#colorLiteral(red: 0.9087617397, green: 0.9362817407, blue: 0.9985759854, alpha: 1))

                                RoundedRectangle(cornerRadius:16, style: .continuous)
                                    .foregroundColor(.white)
                                    .blur(radius: 4)
                                    .offset(x: -8, y: -8)
                                RoundedRectangle(cornerRadius:16, style: .continuous)
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8891553283, green: 0.9166718125, blue: 0.9789679646, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                    .padding(2)
                                    .blur(radius: 2)
                            }
                    )
                        .clipShape(RoundedRectangle(cornerRadius:16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.7626122832, green: 0.8218374252, blue: 0.9257722497, alpha: 1)), radius: 20, x: 20, y: 20)
                        .shadow(color: Color(#colorLiteral(red: 0.9958658814, green: 1, blue: 0.9999271035, alpha: 1)), radius: 20, x: -20, y: -20)
                }

                Button(action: {
                    withAnimation (.linear(duration: 0.5), {
                        self.textValue += 1
                    })
                    pauseMusic()
                })
                {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                    
                }
                .buttonStyle(ColorfulButtonStyle())

                Toggle(isOn: $isToggled) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                }
                .toggleStyle(ColorfulToggleStyle())

            }
            
        }
        .edgesIgnoringSafeArea(.all)

    
    }
    
}

var audioPlayer: AVAudioPlayer?

func playMusic() {

    let sound = Bundle.main.path(forResource: "Doja", ofType: "wav")

    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer?.play()
    } catch {
        print("error")
        }
}

func pauseMusic() {

    let sound = Bundle.main.path(forResource: "Doja", ofType: "wav")

    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer?.pause()
    } catch {
        print("error")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
