import SpriteKit
import Foundation

public class MenuScene: SKScene {
    
    let backgroundImage = SKSpriteNode(imageNamed: "menuScreen")

    override public func didMove(to view: SKView) {
        backgroundImage.size = self.size
        backgroundImage.position = CGPoint(x:self.size.width/2, y: self.size.height/2)
        backgroundImage.zPosition = 0
        self.addChild(backgroundImage)
        
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


