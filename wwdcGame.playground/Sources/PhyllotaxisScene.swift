import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics

public class PhyllotaxisScene : SKScene {
    
    var n: Double = 0
    var scalingFactor: Double = 8
    
    var initialPoint = CGPoint(x: 400, y: 400)
    
    let angle : Float = (Float(Double.pi) / 1.31099)
    
    var sceneToLoad:SKScene?
    
    override public func didMove(to view: SKView) {
        self.scene!.backgroundColor = SKColor.black
        
        let backButton = SKShapeNode(rect: CGRect(x: 20, y: 725, width: 150, height: 40),cornerRadius: 30)
        backButton.fillColor = .clear
        backButton.lineWidth = 2
        backButton.name = "backButton"
        backButton.zPosition = 50
        
        let buttonLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
        buttonLabel.text = "Back"
        buttonLabel.fontSize = 20
        buttonLabel.fontColor = SKColor.white
        buttonLabel.position = CGPoint(x:backButton.frame.midX ,y:backButton.frame.midY - 10)
        
        backButton.addChild(buttonLabel)
        addChild(backButton)
        
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
    
    // MARK: - touches began function
    public override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?) {
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            let node = atPoint(location)
            
            if node.name == "backButton" {
                sceneToLoad = MenuScene(fileNamed: "MenuScene")
                if let scene = sceneToLoad {
                    scene.size = size
                    scene.scaleMode = scaleMode
                    let transition = SKTransition.fade(withDuration: 0.5)
                    self.view?.presentScene(scene, transition: transition)
                }
            }
        }
    }
    
}
