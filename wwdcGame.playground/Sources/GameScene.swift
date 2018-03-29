import SpriteKit
import Foundation

public class GameScene: SKScene {

    let background1 = SKSpriteNode(imageNamed: "bg1")
    let background2 = SKSpriteNode(imageNamed: "bg2")
    
    override public func didMove(to view: SKView) {
        
        let images : [UIImage] = [UIImage(named: "bg1")!, UIImage(named: "bg2")!]
        let scrollingBackground = InfiniteScrollingBackground(images: images, scene: self, scrollDirection: .left, speed: 15)
        
        scrollingBackground!.scroll()
        scrollingBackground!.zPosition = 0.5
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

