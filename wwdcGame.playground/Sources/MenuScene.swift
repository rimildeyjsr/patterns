import SpriteKit
import Foundation

//MARK: - ENUM for scenes
enum SceneType: Int {
    
    case MenuScene   = 0
    case TenPrintScene      //1
    case FractalTreesScene      //2
    case PhyllotaxisScene //3
    case About //4
}

public class MenuScene: SKScene {
    
    // MARK: - initializations
    let actq = ActionQ()
    
    let titleLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
    let descriptionLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
    let menuLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
    
    let menuButtonNamesArray : [String] = ["10 Pattern","Fractal Tree","Phyllotaxis","About"]
    var shapeArray : [SKShapeNode] = []
    
    let quote: String = """
    There are only patterns,
    patterns on top of patterns,
    patterns that affect other patterns.
    Patterns hidden by patterns.
    Patterns within patterns.
    - Chuck Palahnuik
    """
    
    
    // MARK: - did move view
    override public func didMove(to view: SKView) {
        self.scene!.backgroundColor = SKColor.black
        

        // MARK: title label
        titleLabel.text = "Patterns"
        titleLabel.fontSize = 65
        titleLabel.fontColor = SKColor.white
        titleLabel.position = CGPoint(x:frame.midX,y:frame.midY)
        titleLabel.alpha = 0.0
        actq.addNext(sprite: titleLabel,action: SKAction.fadeIn(withDuration: 2.0) )
        actq.addNext(sprite: titleLabel,action: SKAction.fadeOut(withDuration: 2.0) )
        addChild(titleLabel)
        
        // MARK: description label
        descriptionLabel.text = quote
        descriptionLabel.fontSize = 35
        descriptionLabel.fontColor = SKColor.white
        descriptionLabel.position = CGPoint(x:440,y:230)
        descriptionLabel.alpha = 0.0
        descriptionLabel.numberOfLines = 0
        descriptionLabel.preferredMaxLayoutWidth = 700
        actq.addNext(sprite: descriptionLabel,action: SKAction.fadeIn(withDuration: 2.0) )
        actq.addNext(sprite: descriptionLabel,action: SKAction.fadeOut(withDuration: 5.0) )
        addChild(descriptionLabel)
        
        // MARK: menu
        menuLabel.text = "Menu"
        menuLabel.fontSize = 40
        menuLabel.fontColor = SKColor.white
        menuLabel.position = CGPoint(x:frame.midX,y:frame.midY+200)
        menuLabel.alpha = 0.0
        actq.addNext(sprite: menuLabel,action: SKAction.fadeIn(withDuration: 2.0) )
        addChild(menuLabel)
        
        // MARK: loop to create buttons
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
            buttonLabel.position = CGPoint(x:menuButton.frame.midX ,y:menuButton.frame.midY - 10)
            
            menuButton.addChild(buttonLabel)
            shapeArray.append(menuButton)
            
        }
        
        // MARK: adding buttons to scene as nodes
        for shape in shapeArray{
            actq.addNext(sprite: shape,action: SKAction.fadeIn(withDuration: 0.5))
            addChild(shape)
        }
        
    }
    
    // MARK: - go to scene function
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
            
        case SceneType.About:
            sceneToLoad = About(fileNamed:"About")
        }
        
        if let scene = sceneToLoad {
            scene.size = size
            scene.scaleMode = scaleMode
            let transition = SKTransition.fade(withDuration: 0.5)
            self.view?.presentScene(scene, transition: transition)
        }
    }

    // MARK: - touches began function
    public override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?) {
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            let node = atPoint(location)
            
            if node.name == "10 Pattern"{
                
                goToScene(newScene: SceneType.TenPrintScene)
                
            } else if node.name == "Fractal Tree" {
                
                goToScene(newScene: SceneType.FractalTreesScene)
                
            } else if node.name == "Phyllotaxis" {
                
                goToScene(newScene: SceneType.PhyllotaxisScene)
                
            } else if node.name == "About" {
                
                goToScene(newScene: SceneType.About)
            }
        }
    }
}
