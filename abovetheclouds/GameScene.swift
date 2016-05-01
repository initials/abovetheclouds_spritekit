//
//  GameScene.swift
//  abovetheclouds
//
//  Created by Shane Brouwer on 1/05/2016.
//  Copyright (c) 2016 initials video games. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var startLoc = CGPoint()
    var plane = Plane()
    var myWorld = SKNode()
    var camera2 = SKNode()
    
    
    
    override func didMoveToView(view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        self.addChild(myWorld)
        
        camera2.name = "camera2"
        myWorld.addChild(camera2)
        
        self.backgroundColor = UIColor.init(colorLiteralRed: 249/255, green: 162/255, blue: 119/225, alpha: 1.0)
        
//        let plane = Plane()
        plane.position = CGPoint(x: 237, y: 470)
        plane.name = "Plane"
        myWorld.addChild(plane)
        
        for _index in 1...50 {
            let cloud = SKSpriteNode(imageNamed: "Cloud")
            
            cloud.position = CGPoint(
                x:CGFloat((_index-3)*150),
                y:plane.position.y + CGFloat(arc4random_uniform(150)));
            
            myWorld.addChild(cloud)
        }

        
    }
    
    func centerOnNode(node: SKNode) {
        let cameraPositionInScene: CGPoint = node.scene!.convertPoint(node.position, fromNode: node.parent!)
        
        node.parent!.position = CGPoint(x:node.parent!.position.x - cameraPositionInScene.x, y:node.parent!.position.y - cameraPositionInScene.y)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            print (location)
            plane.physicsBody?.velocity.dx += (startLoc.x - location.x)/40
            plane.physicsBody?.velocity.dy += (startLoc.y - location.y)/40
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches
        {
            let location = touch.locationInNode(self)
            print ("began @", location)
            startLoc = location;
            
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override func didFinishUpdate() {
        centerOnNode(myWorld.childNodeWithName("Plane")!)
        
    }
}
