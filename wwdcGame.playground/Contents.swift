import PlaygroundSupport
import SpriteKit

let view = SKView(frame: CGRect(x: 0, y: 0, width: 800,height:800))

/*if let scene = MenuScene(fileNamed: "MenuScene") {
    scene.scaleMode = .aspectFill
    view.presentScene(scene)
}*/

if let scene = TenPrintScene(fileNamed: "TenPrintScene") {
    scene.scaleMode = .aspectFill
    view.presentScene(scene)
}

/*if let scene = FractalTreesScene(fileNamed: "FractalTreesScene") {
    scene.scaleMode = .aspectFill
    view.presentScene(scene)
}
 */

PlaygroundSupport.PlaygroundPage.current.liveView = view


