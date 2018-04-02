import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics

public class Phyllotaxis : SKScene {
    
    var n: Double = 0
    var scalingFactor: Double = 8
    
    var initialPoint = CGPoint(x: 400, y: 400)
    
    let angle : Float = (Float(Double.pi) / 1.309)
    
    override public func didMove(to view: SKView) {
        self.scene!.backgroundColor = SKColor.black
        
        while ( n != 1000) {
            var rotateAngle = Float(n) * angle
            var radius = scalingFactor * sqrt(n)
            var x = Float(radius) * cosf(rotateAngle)
            var y = Float(radius) * sinf(rotateAngle)
            
            let dot = SKShapeNode(circleOfRadius: 5.0)
            dot.position = CGPoint(x: CGFloat(x) + initialPoint.x , y: CGFloat(y) + initialPoint.y)
            dot.fillColor = .green
            dot.zPosition = 20
            addChild(dot)
            
            n += 1
        }
    }
}
