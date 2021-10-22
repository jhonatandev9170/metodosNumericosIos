//
//  NewtonMethod.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 19/10/21.
//

import Foundation
class NewtonRapson{
    private let function:String
    private let initPoint:Double
    private let derived:String
    private let error:Double
    static let name = "Newton-Raphson"
    static let dataLabel=["iteracion","xi","f(i)","d(i)","xi+1","error"]
    
    init(function:String ,derived:String,initPoint:Double ,error:Double) {
        self.function=function
        self.derived=derived
        self.initPoint=initPoint
        self.error=error
    }
    
    func calculoRaiz() -> [RootResultModel] {
        var errorCalc=initPoint
        var root=initPoint
        var rootprev:Double
        var data:[RootResultModel]=[]
        var i = 0.0
        while abs(errorCalc) >= error {
            i=i+1;
            rootprev=root
            let fi=eval(function: function, x: root)
            let di=eval(function: derived, x: root)
            root=root - fi/di
            errorCalc=(root-rootprev)/root
            data.append(RootResultModel(data: [
                "iteracion":i,
                "xi":rootprev,
                "f(i)":fi,
                "d(i)":di,
                "xi+1":root,
                "error":errorCalc
            ]))
        }
        return data
    }
    
    func eval (function:String, x:Double)->Double{
        var replaced = function.replacingOccurrences(of: "x", with: "\(x)")
        replaced = replaced.replacingOccurrences(of: "^", with: "**")
        replaced = replaced.replacingOccurrences(of: "e\(x)p", with: "exp")
        let stringWithMathematicalOperation: String = replaced// Example
        let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation)
        let result: Double = exp.expressionValue(with:nil, context: nil) as! Double
        return result
        
    }
}
