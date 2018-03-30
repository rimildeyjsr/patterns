import PlaygroundSupport
import SpriteKit

let view = SKView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width,height:UIScreen.main.bounds.height))

if let scene = MenuScene(fileNamed: "MenuScene") {
    scene.scaleMode = .aspectFill
    view.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = view


