import SpriteKit
import Foundation
import CoreGraphics

public class FractalTreesScene: SKScene {

    var tree = [Branch]()
    var leaves = [CGPoint]()
    
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
            count += 1;
            
            if (count == 6) {
                for i in 0..<tree.count {
                    if (!tree[i].finished) {
                        let leaf = tree[i].end
                        leaves.append(leaf);
                    }
                }
            }
        }
        
        for i in 0..<tree.count {
            tree[i].show()
        }
        
        for i in 0..<leaves.count {
            let leaf = SKShapeNode(circleOfRadius: 3.0)
            leaf.position = leaves[i]
            leaf.fillColor = .red
            addChild(leaf)
        }
        
    }
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
    
}


