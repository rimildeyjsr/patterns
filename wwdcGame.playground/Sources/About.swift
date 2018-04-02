import SpriteKit
import Foundation

public class About: SKScene {
    var sceneToLoad:SKScene?
    
    var aboutString: String =
    """
    When seemingly complex things are broken down
    into small parts and the patterns between them
    are observed, it becomes easier to comprehend them.

    Everyone uses this approach to learn new concepts.
    Once our younger selves understood the pattern between
    numbers, it was easy to tell which number comes before,
    after or in between. Slowly we could recite entire number
    ranges in the blink of an eye.

    I learnt programming in the same way. And tried to
    apply it while making these patterns.

    Made with ❤️ and ☕
    """
    
    let titleLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
    let descriptionLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
    
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
        
        titleLabel.text = "Patterns"
        titleLabel.fontSize = 30
        titleLabel.fontColor = SKColor.white
        titleLabel.position = CGPoint(x:frame.midX,y:700)
        addChild(titleLabel)
        
        descriptionLabel.text = aboutString
        descriptionLabel.fontSize = 25
        descriptionLabel.fontColor = SKColor.white
        descriptionLabel.position = CGPoint(x:420,y:80)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.preferredMaxLayoutWidth = 700
        addChild(descriptionLabel)
        
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
