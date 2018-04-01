import SpriteKit
import UIKit
import Foundation

public class TenPrintScene: SKScene {
    
    //let probabilitySlider = UISlider()
    //let spacingSlider = UISlider()
    
    var initial_x = 0
    var initial_y = 0
    let spacing = 50
    var done: DarwinBoolean = true

    override public func didMove(to view: SKView) {
        self.scene!.backgroundColor = SKColor.black
        
        while (done == true){
            let random_value = Float(arc4random()) / Float(UInt32.max)
            if(random_value < 0.5) {
                var points = [CGPoint(x: initial_x, y: initial_y),
                              CGPoint(x: initial_x + spacing, y: initial_y + spacing)]
                let linearShapeNode = SKShapeNode(points: &points,
                                                  count: points.count)
                linearShapeNode.lineWidth = 5
                addChild(linearShapeNode)
            } else {
                var points = [CGPoint(x: initial_x, y: initial_y + spacing),
                              CGPoint(x: initial_x + spacing, y: initial_y)]
                let linearShapeNode = SKShapeNode(points: &points,
                                                  count: points.count)
                linearShapeNode.lineWidth = 5
                addChild(linearShapeNode)
            }
            
            initial_x += spacing
            if (initial_x > 800) {
                initial_x = 0
                initial_y += spacing
            }
            if(initial_y >= 800){
                done = false
            }
        }
        
        
        /*probabilitySlider.minimumValue = 0.0
        probabilitySlider.maximumValue = 1.0
        addChild(probabilitySlider)
        
        spacingSlider.minimumValue = 0
        spacingSlider.maximumValue = 100
        addChild(spacingSlider)*/
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

