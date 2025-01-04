//
//  UsingCoreAnimationView.swift
//  SnowEffects
//
//  Created by Samar Khaled on 04/01/2025.
//

import SwiftUI
import UIKit

struct UsingCoreAnimationView: View {
    var body: some View {
        VStack {
            SnowEmitterView()
        }
        .ignoresSafeArea()
    }
}

struct SnowEmitterView: UIViewRepresentable {
    private let size = 10
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .black // Set the background to black

        // Create and configure the emitter layer
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        emitterLayer.renderMode = .additive // Keep snowflakes visible
        emitterLayer.emitterPosition = CGPoint(x: UIScreen.main.bounds.width, y: -5) // Emitter at the top
        emitterLayer.emitterShape = .rectangle
        emitterLayer.emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 1) // Emitter size covering the full width of the screen

        // Create and configure the snowflake cell
        let snowflake = CAEmitterCell()
        // Snowflake drawn as a simple white circle
        snowflake.contents = UIGraphicsImageRenderer(
            size: CGSize(
                width: size,
                height: size
            )
        ).image { context in
            context.cgContext.setFillColor(
                UIColor.white.cgColor
            )
            context.cgContext.fillEllipse(
                in: CGRect(
                    x: 0,
                    y: 0,
                    width: size,
                    height: size
                )
            )
        }.cgImage

        snowflake.birthRate = 20 // More snowflakes
        snowflake.lifetime = 50 // Snowflakes live for 10 seconds
        snowflake.velocity = 60 // Speed of falling snowflakes
        snowflake.velocityRange = 50 // Random speed variation
        snowflake.emissionLongitude = .pi // Snowflakes fall downwards
        snowflake.emissionRange = .pi / 2 // Allow slight variation in falling direction
        snowflake.scale = 0.3 // Snowflakes are small
        snowflake.scaleRange = 0.1 // Randomize snowflake size
        snowflake.color = UIColor.white.cgColor // Set snowflakes to white color
        snowflake.alphaSpeed = -0.05 // Gradually fade snowflakes as they fall

        emitterLayer.emitterCells = [snowflake] // Add the snowflake to the emitter

        view.layer.addSublayer(emitterLayer) // Add emitter to the view's layer

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
    UsingCoreAnimationView()
}
