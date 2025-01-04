//
//  UsingSpriteKitView.swift
//  SnowEffects
//
//  Created by Samar Khaled on 04/01/2025.
//

import SpriteKit
import SwiftUI

struct UsingSpriteKitView: View {
    private var scene: SKScene {
        let scene = SnowScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }

    var body: some View {
        SpriteView(scene: scene, options: [.allowsTransparency])
            .ignoresSafeArea()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.black)
    }
}

#Preview {
    UsingSpriteKitView()
}
