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
            let rotateAngle = Float(n) * angle
            let radius = scalingFactor * sqrt(n)
            let x = Float(radius) * cosf(rotateAngle)
            let y = Float(radius) * sinf(rotateAngle)
            
            
            let dot = SKShapeNode(circleOfRadius: 4.0)
            dot.position = CGPoint(x: CGFloat(x) + initialPoint.x , y: CGFloat(y) + initialPoint.y)
            let hueValue = decideColor(n)
            dot.fillColor = SKColor(hue: CGFloat(hueValue),saturation: 1.0,brightness: 1.0,alpha: 1.0)
            dot.zPosition = 20
            addChild(dot)
            
            n += 1
        }
    }
    
    func decideColor(_ : Double) -> Float {
        let rem = n.truncatingRemainder(dividingBy : 10)
        switch(rem) {
        	case 1: return 0.1
            case 2: return 0.2
            case 3: return 0.3
            case 4: return 0.4
            case 5: return 0.5
            case 6: return 0.6
            case 7: return 0.7
            case 8: return 0.8
            case 9: return 0.9
        default: return 0.0
        }
    }
    
}
