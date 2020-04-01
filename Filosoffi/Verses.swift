//
//  ContentView.swift
//  Filosoffi
//
//  Created by Nadia Leung on 3/30/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import SwiftUI


import Foundation
import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack {
            Text("Button")
                .font(.system(size:20, weight: .semibold, design: .rounded))
                .frame(width: 35000, height: 200)
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.9958658814, green: 1, blue: 0.9999271035, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
