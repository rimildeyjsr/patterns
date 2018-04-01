import SpriteKit
import Foundation

public class FractalTreesScene: SKScene {

    var tree = [Branch]()
    var leaves = [Branch]()
    
    var count = 0;
    let tree_width = 400
    let tree_height = 0
    
    override public func didMove(to view: SKView) {
        self.scene!.backgroundColor = SKColor.black
        
        let a = CGPoint(x: tree_width,y: tree_height)
        let b = CGPoint(x: tree_width,y: tree_height + 100)
        let root = Branch(a,b,false)
        tree[0] = root
        
        for i in stride(from: tree.count, to: 0, by: -1) {
            if (tree[i].finished == false) {
                tree.append(tree[i].branchRight());
                tree.append(tree[i].branchLeft());
            }
            tree[i].finished = true;
        }
        count += 1;
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
}


