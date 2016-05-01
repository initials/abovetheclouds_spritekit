import UIKit
import SpriteKit

class Plane: SKSpriteNode {
    
    var invaderRow = 0
    var invaderColumn = 0
    
    init() {
        let texture = SKTexture(imageNamed: "Plane")
        super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
        self.name = "plane"
        self.xScale=2
        self.yScale=2
        self.userInteractionEnabled=true
        
        physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 20, height: 20))
        
//        physicsBody?.applyForce(CGVector(dx: 0, dy: -98));
        physicsBody?.mass=1;
        physicsBody?.restitution = 0.85
        physicsBody?.affectedByGravity=false
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    func fireBullet(scene: SKScene){
        
    }
    
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            print (location)
//        }
//    }
//    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        for touch in touches
//        {
//            let location = touch.locationInNode(self)
//            print ("began @", location)
//            
//        }
//    }
    
}