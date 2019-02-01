//
//  GameScene.swift
//  GoatSimTripToDick
//
//  Created by Podvorniy Ivan on 01/02/2019.
//  Copyright © 2019 Podvorniy Ivan. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreGraphics
class GameScene: SKScene {
    
    
    private var lastUpdateTime : TimeInterval = 0
    private var bg = SKSpriteNode(imageNamed: "school-corridor")
    private var bg_c = SKSpriteNode(imageNamed: "school-corridor")
    private var goat = SKSpriteNode(imageNamed: "goat")
    override func sceneDidLoad() {
        goat.position = CGPoint(x: frame.midX, y: frame.midY - 200)
        goat.zPosition = 20
        goat.size = CGSize(width: 300, height: 250)
        bg.position = CGPoint(x: 0, y: 0)
        bg_c.position = CGPoint(x: bg.size.width, y: 0)
        addChild(bg_c)
        addChild(bg)
        addChild(goat)
        self.lastUpdateTime = 0
        bg.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: -bg.size.width, y: 0), duration: 4), SKAction.move(to: CGPoint(x: 0, y: 0), duration: 0)])))
        bg_c.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: 0, y: 0), duration: 4),
                                                           SKAction.move(to: CGPoint(x: bg.size.width, y: 0), duration: 0)])))

    }
    
    override func keyDown(with event: NSEvent) {
        if let ch = event.characters
        {
            if (ch == " ")
            {
                goat.run(SKAction.sequence([SKAction.move(to: CGPoint(x: goat.position.x, y: goat.position.y + 120), duration: 0.5), SKAction.move(to: CGPoint(x: goat.position.x, y: goat.position.y), duration: 0.5)]))
            }
        }
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        
        self.lastUpdateTime = currentTime
    }
}
