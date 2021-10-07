import UIKit
func eval (function:String, x:String)->String{
    var replaced = function.replacingOccurrences(of: "x", with: x)
    replaced = replaced.replacingOccurrences(of: "^", with: "**")
    replaced = replaced.replacingOccurrences(of: "e"+x+"p", with: "exp")
    let stringWithMathematicalOperation: String = replaced// Example
    let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation)
    let result: Double = exp.expressionValue(with:nil, context: nil) as! Double //
    return String(result)
    
}
let a:String=eval(function: "x^-2" ,x: "1.414")





