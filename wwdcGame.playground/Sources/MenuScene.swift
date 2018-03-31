import SpriteKit
import Foundation

public class MenuScene: SKScene {
    
    let actq = ActionQ()
    
    let titleLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
    let descriptionLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
   
    override public func didMove(to view: SKView) {
        titleLabel.text = "Arbitrary"
        titleLabel.fontSize = 65
        titleLabel.fontColor = SKColor.green
        titleLabel.position = CGPoint(x:frame.midX,y:frame.midY)
        titleLabel.alpha = 0.0
        actq.addNext(sprite: titleLabel,action: SKAction.fadeIn(withDuration: 2.0) )
        actq.addNext(sprite: titleLabel,action: SKAction.fadeOut(withDuration: 2.0) )
        addChild(titleLabel)
        
        descriptionLabel.text = "A collection of random things"
        descriptionLabel.fontSize = 40
        descriptionLabel.fontColor = SKColor.green
        descriptionLabel.position = CGPoint(x:frame.midX,y:frame.midY)
        descriptionLabel.alpha = 0.0
        actq.addNext(sprite: descriptionLabel,action: SKAction.fadeIn(withDuration: 2.0) )
        actq.addNext(sprite: descriptionLabel,action: SKAction.fadeOut(withDuration: 2.0) )
        addChild(descriptionLabel)
        
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


