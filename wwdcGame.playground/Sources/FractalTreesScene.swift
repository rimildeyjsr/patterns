import SpriteKit
import GameplayKit
import Foundation
import CoreGraphics

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

public class FractalTreesScene: SKScene {
    var tree : [Branch] = []
    var leaves : [CGPoint] = []
    var depth : Int = 0
    
    let a = CGPoint(x: 400,y: 0)
    let b = CGPoint(x: 400,y: 250)
    
    override public func didMove(to view: SKView) {
        self.scene!.backgroundColor = SKColor.black
        
        let root = Branch(begin : a, end : b,finished : false, depth: 0)
        tree.append(root)
        
        depth = 1
        var index = 0
        for i in 0...(2 ^^ 6) {
            if (tree[i].finished == false) {
                tree.append(tree[i].branchRight(depthBranch: depth));
                tree.append(tree[i].branchLeft(depthBranch: depth));
            }
            tree[i].finished = true;
            if (i == 0){
                index = 1
                depth += 1
            } else {
                
                if ( i == (2 ^^ index)) {
                    depth += 1
                    index += 1
                }
            }
            
            
            if (depth == 7) {
                for i in 0..<tree.count {
                    if (!tree[i].finished) {
                        let leaf = tree[i].end
                        leaves.append(leaf);
                    }
                }
            }
        }
        
        for i in 0..<tree.count {
            show(tree[i])
        }
        
        for i in 0..<leaves.count {
            let leaf = SKShapeNode(circleOfRadius: 10.0)
            leaf.position = leaves[i]
            leaf.fillColor = .green
            leaf.zPosition = 20
            addChild(leaf)
        }
        
    }
    
    
    public func show(_ a: Branch) {
        var points = [CGPoint(x: a.begin.x, y: a.begin.y),
                      CGPoint(x: a.end.x, y: a.end.y)]
        let line = SKShapeNode(points: &points,
                               count: points.count)
        line.lineWidth = 5
        line.strokeColor = .white
        line.zPosition = 5
        addChild(line)
    }
    
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
}
