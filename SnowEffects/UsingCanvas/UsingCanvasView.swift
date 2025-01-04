//
//  UsingCanvasView.swift
//  SnowEffects
//
//  Created by Samar Khaled on 04/01/2025.
//

import SwiftUI

struct UsingCanvasView: View {
    @State private var snowflakes: [Snowflake] = []

    private let numberOfSnowflakes = 100

    var body: some View {
        Canvas { context, _ in
            for snowflake in snowflakes {
                let position = CGPoint(x: snowflake.x, y: snowflake.y)
                let radius = snowflake.size
                context.fill(
                    Path(ellipseIn: CGRect(x: position.x - radius, y: position.y - radius, width: radius * 2, height: radius * 2)),
                    with: .color(.white)
                )
            }
        }
        .onAppear {
            startSnowfall()
        }
        .background(Color.black)
        .ignoresSafeArea()
    }

    private func startSnowfall() {
        var flakes: [Snowflake] = []
        for _ in 0 ..< numberOfSnowflakes {
            let x = CGFloat.random(in: 0 ... UIScreen.main.bounds.width)
            let y = CGFloat.random(in: -100 ... UIScreen.main.bounds.height)
            let size = CGFloat.random(in: 2 ... 6)
            let speed = Double.random(in: 2 ... 6)
            flakes.append(Snowflake(x: x, y: y, size: size, speed: speed))
        }

        // Update snowflake positions over time
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            for i in 0 ..< flakes.count {
                flakes[i].y += flakes[i].speed
                if flakes[i].y > UIScreen.main.bounds.height {
                    flakes[i].y = -10
                }
            }
            snowflakes = flakes
        }
    }
}

struct Snowflake {
    var x: CGFloat
    var y: CGFloat
    var size: CGFloat
    var speed: Double
}

#Preview {
    UsingCanvasView()
}
