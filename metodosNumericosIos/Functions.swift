//
//  Functions.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 23/10/21.
//

import Foundation
class Functions {
    static func eval (function:String, x:Double)->Double{
        var replaced = function.replacingOccurrences(of: "x", with: "\(x)")
        replaced = replaced.replacingOccurrences(of: "^", with: "**")
        replaced = replaced.replacingOccurrences(of: "e\(x)p", with: "exp")
        let stringWithMathematicalOperation: String = replaced// Example
        let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation)
        let result: Double = exp.expressionValue(with:nil, context: nil) as! Double
        return result
        
    }
}
