import SpriteKit
import Foundation

enum SceneType: Int {
    
    case MenuScene   = 0
    case TenPrintScene      //1
    case FractalTreesScene      //2
    case PhyllotaxisScene //3
}

public class MenuScene: SKScene {
    
    let actq = ActionQ()
    
    let titleLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
    let descriptionLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
    let menuLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
    
    let menuButtonNamesArray : [String] = ["10 Pattern","Fractal Trees","Phyllotaxis"]
    var shapeArray : [SKShapeNode] = []
    
    override public func didMove(to view: SKView) {
        self.scene!.backgroundColor = SKColor.black
        
        titleLabel.text = "Patterns"
        titleLabel.fontSize = 65
        titleLabel.fontColor = SKColor.white
        titleLabel.position = CGPoint(x:frame.midX,y:frame.midY)
        titleLabel.alpha = 0.0
        actq.addNext(sprite: titleLabel,action: SKAction.fadeIn(withDuration: 2.0) )
        actq.addNext(sprite: titleLabel,action: SKAction.fadeOut(withDuration: 2.0) )
        addChild(titleLabel)
        
        descriptionLabel.text = "some random quote"
        descriptionLabel.fontSize = 40
        descriptionLabel.fontColor = SKColor.white
        descriptionLabel.position = CGPoint(x:frame.midX,y:frame.midY)
        descriptionLabel.alpha = 0.0
        actq.addNext(sprite: descriptionLabel,action: SKAction.fadeIn(withDuration: 2.0) )
        actq.addNext(sprite: descriptionLabel,action: SKAction.fadeOut(withDuration: 2.0) )
        addChild(descriptionLabel)
        
        menuLabel.text = "Menu"
        menuLabel.fontSize = 40
        menuLabel.fontColor = SKColor.white
        menuLabel.position = CGPoint(x:frame.midX,y:frame.midY+200)
        menuLabel.alpha = 0.0
        actq.addNext(sprite: menuLabel,action: SKAction.fadeIn(withDuration: 2.0) )
        addChild(menuLabel)
        
        for i in 0..<menuButtonNamesArray.count {
            let menuButton = SKShapeNode(rect: CGRect(x: frame.midX-200, y: frame.midX + 100 - CGFloat(i*80), width: 400, height: 60),cornerRadius: 30)
            menuButton.fillColor = .clear
            menuButton.lineWidth = 2
            menuButton.alpha = 0.0
            menuButton.name = menuButtonNamesArray[i]
            
            
            let buttonLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
            buttonLabel.text = menuButtonNamesArray[i]
            buttonLabel.fontSize = 30
            buttonLabel.fontColor = SKColor.white
            buttonLabel.position = CGPoint(x:menuButton.frame.midX ,y:menuButton.frame.midY - 15)
            
            menuButton.addChild(buttonLabel)
            shapeArray.append(menuButton)
            
        }
        
        for shape in shapeArray{
            actq.addNext(sprite: shape,action: SKAction.fadeIn(withDuration: 0.5))
            addChild(shape)
        }
        
    }
    
    func goToScene(newScene: SceneType){
        
        var sceneToLoad:SKScene?
        
        switch newScene {
            
        case SceneType.MenuScene:
            sceneToLoad = MenuScene(fileNamed: "MenuScene")
            
        case SceneType.TenPrintScene:
            sceneToLoad = TenPrintScene(fileNamed:"TenPrintScene")
            
        case SceneType.FractalTreesScene:
            sceneToLoad = FractalTreesScene(fileNamed:"FractalTreesScene")
            
        case SceneType.PhyllotaxisScene:
            sceneToLoad = PhyllotaxisScene(fileNamed:"PhyllotaxisScene")
            
        }
        
        if let scene = sceneToLoad {
            scene.size = size
            scene.scaleMode = scaleMode
            let transition = SKTransition.fade(withDuration: 2)
            self.view?.presentScene(scene, transition: transition)
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?) {
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            let node = atPoint(location)
            
            if node.name == "10 Pattern"{
                
                goToScene(newScene: SceneType.TenPrintScene)
                
            } else if node.name == "Fractal Trees" {
                
                goToScene(newScene: SceneType.FractalTreesScene)
                
            } else if node.name == "Phyllotaxis" {
                
                goToScene(newScene: SceneType.PhyllotaxisScene)
            }
        }
    }
}
