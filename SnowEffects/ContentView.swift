//
//  ContentView.swift
//  SnowEffects
//
//  Created by Samar Khaled on 04/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink("Using SpriteKit", destination: UsingSpriteKitView())

                NavigationLink("Using Animation", destination: UsingAnimationView())

                NavigationLink("Using Canvas", destination: UsingCanvasView())

                NavigationLink("Using Core Animation", destination: UsingCoreAnimationView())
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
