import Foundation
import SpriteKit
import CoreGraphics

public class Branch : SKScene {
    
    var begin = CGPoint()
    var end = CGPoint()
    var finished: Bool = false
    
    public required init(_ begin: CGPoint,_ end: CGPoint,_ finished: Bool){
        self.begin = begin
        self.end = end
        self.finished = finished
        super.init()
    }
   
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    public func show() {
        var points = [CGPoint(x: begin.x, y: begin.y),
                      CGPoint(x: end.x, y: end.y)]
        let line = SKShapeNode(points: &points,
                                          count: points.count)
        line.lineWidth = 5
        addChild(line)
    }
    
    public func branchRight() -> Branch {
        
        let angle : Float = (30 * Float(Double.pi) / 180)
        let point = CGPoint(x: end.x - begin.y , y : end.y - begin.y)
        let dir_x = Float(point.x)
        let dir_y = Float(point.y)
        
        var rotatedPoint : CGPoint = point
        rotatedPoint.x = CGFloat(dir_x * cosf(angle) - dir_y * sinf(angle)) * 0.67
        rotatedPoint.y = CGFloat(dir_y * cosf(angle) + dir_x * sinf(angle)) * 0.67
        
        let newEnd = CGPoint(x : end.x + rotatedPoint.x, y: end.y + rotatedPoint.y)
        return(Branch(end,newEnd,false))
    }
    
    public func branchLeft() -> Branch{
        
        let angle : Float = -(30 * Float(Double.pi) / 180)
        let point = CGPoint(x: end.x - begin.y , y : end.y - begin.y)
        let dir_x = Float(point.x)
        let dir_y = Float(point.y)
        
        var rotatedPoint : CGPoint = point
        rotatedPoint.x = CGFloat(dir_x * cosf(angle) - dir_y * sinf(angle)) * 0.67
        rotatedPoint.y = CGFloat(dir_y * cosf(angle) + dir_x * sinf(angle)) * 0.67
        
        let newEnd = CGPoint(x : end.x + rotatedPoint.x, y: end.y + rotatedPoint.y)
        return(Branch(end,newEnd,false))
        
    }
    
}
