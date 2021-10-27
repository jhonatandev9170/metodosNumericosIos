//
//  Functions.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 23/10/21.
//

import Foundation
class Funcs {
    static func eval (function:String, x:Double)->Double{
        var replaced = function.replacingOccurrences(of: "x", with: "\(x)")
        replaced = replaced.replacingOccurrences(of: "^", with: "**")
        replaced = replaced.replacingOccurrences(of: "e\(x)p", with: "exp")
        let stringWithMathematicalOperation: String = replaced// Example
        let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation)
        let result: Double = exp.expressionValue(with:nil, context: nil) as! Double
        return result
        
    }
    static func toDouble(_ x:Int)->Double{
        var number = Double(x)
        let divisor = pow(10.0, 8.0)
        number = (number * divisor).rounded() / divisor
        return number
    }
    static func toDouble(_ :String){
        print("string")
    }
}
extension Double {
    /// Rounds the double to decimal places value
    func rounded(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
