import SpriteKit
import Foundation

public class GameScene: SKScene {

    let background1 = SKSpriteNode(imageNamed: "bg1")
    let background2 = SKSpriteNode(imageNamed: "bg2")
    
    override public func didMove(to view: SKView) {
        background1.size = self.size
        background1.position = CGPoint(x:self.size.width/2, y: self.size.height/2)
        background1.zPosition = 0
        self.addChild(background1)
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
       
       
    }
}

