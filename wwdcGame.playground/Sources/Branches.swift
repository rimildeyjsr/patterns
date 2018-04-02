import Foundation
import SpriteKit
import CoreGraphics

public class Branch {
    
    var begin = CGPoint()
    var end = CGPoint()
    var finished: Bool = false
    var depth: Int = 0
    
    
    public required init(begin: CGPoint,end: CGPoint,finished: Bool,depth: Int){
        self.begin = begin
        self.end = end
        self.finished = finished
        self.depth = depth
    }
    
    public func branchRight(depthBranch:Int) -> Branch {
        
        let angle : Float = (Float(Double.pi) / 5)
        let point = CGPoint(x: end.x - begin.x , y : end.y - begin.y)
        let dir_x = Float(point.x * 0.67)
        let dir_y = Float(point.y * 0.67)
        var rotatedPoint : CGPoint = point
        rotatedPoint.x = CGFloat(dir_x * cosf(angle) + dir_y * sinf(angle))
        rotatedPoint.y = CGFloat(dir_y * cosf(angle) - dir_x * sinf(angle))
        
        let rotatedVector = CGPoint(x : end.x + rotatedPoint.x, y: end.y + rotatedPoint.y)
        let newEnd = CGPoint(x: rotatedVector.x, y: rotatedVector.y)
        return(Branch(begin: end,end: newEnd,finished: false,depth: depthBranch))
    }
    
    public func branchLeft(depthBranch:Int) -> Branch{
        
        let angle : Float = (Float(Double.pi) / 5)
        let point = CGPoint(x: end.x - begin.x , y : end.y - begin.y)
        let dir_x = Float(point.x * 0.67)
        let dir_y = Float(point.y * 0.67)
        
        var rotatedPoint : CGPoint = point
        rotatedPoint.x = CGFloat(dir_x * cosf(angle) - dir_y * sinf(angle))
        rotatedPoint.y = CGFloat(dir_y * cosf(angle) + dir_x * sinf(angle))
        let rotatedVector = CGPoint(x : end.x + rotatedPoint.x, y: end.y + rotatedPoint.y)
        let newEnd = CGPoint(x: rotatedVector.x, y: rotatedVector.y)
        return(Branch(begin: end,end: newEnd,finished: false,depth:depthBranch))
        
    }
}


