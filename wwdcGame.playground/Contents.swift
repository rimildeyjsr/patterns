import PlaygroundSupport
import SpriteKit

let view = SKView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width,height:UIScreen.main.bounds.height-125))

if let scene = GameScene(fileNamed: "GameScene") {
    scene.scaleMode = .aspectFill
    view.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = view


