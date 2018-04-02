import SpriteKit
import UIKit
import Foundation

public class TenPrintScene: SKScene {
    
    var initial_x = 0
    var initial_y = 50
    let spacing = 50
    var done: DarwinBoolean = true
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
            if(initial_y >= 700){
                done = false
            }
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

