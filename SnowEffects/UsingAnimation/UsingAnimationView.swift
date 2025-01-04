//
//  UsingAnimationView.swift
//  SnowEffects
//
//  Created by Samar Khaled on 04/01/2025.
//

import SwiftUI

struct UsingAnimationView: View {

    var body: some View {
        ZStack {
            ForEach(0 ..< 30) { _ in
                SnowStarView()
            }
        }
        .background(Color.black)
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {}
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SnowStarView: View {
    @State private var flakeYPosition: CGFloat = -100
    private let flakeSize: CGFloat = CGFloat.random(in: 18 ... 40)
    private let animationDuration: Double = Double.random(in: 5 ... 12)
    private let flakeXPosition: CGFloat = CGFloat.random(in: 0 ... UIScreen.main.bounds.width)

    var body: some View {

        Text("❄️")
            .font(.system(size: flakeSize))
            .position(x: flakeXPosition, y: flakeYPosition)
            .onAppear {
                withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                    flakeYPosition = UIScreen.main.bounds.height + 50
                }
            }
    }
}

#Preview {
    UsingAnimationView()
}
