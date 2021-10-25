//
//  NewtonMethod.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 19/10/21.
//

import Foundation
class NewtonRaphson{
    private let function:String
    private let derived:String
    private let error:Double
    private let initPoint:Double
    static let dataLabel=["iteracion","xi","f(i)","d(i)","xi+1","error"]
    
    init(function:String ,derived:String,initPoint:Double ,error:Double) {
        self.function=function
        self.derived=derived
        self.initPoint=initPoint
        self.error=error
    }
    
    func calculoRaiz() -> [ResultModel] {
        var errorCalc=initPoint
        var root=initPoint
        var rootprev:Double
        var data:[ResultModel]=[]
        var i = 0.0
        while abs(errorCalc) >= error {
            i=i+1;
            rootprev=root
            let fi=Functions.eval(function: function, x: root)
            let di=Functions.eval(function: derived, x: root)
            root=root - fi/di
            errorCalc=(root-rootprev)/root
            data.append(ResultModel(data: [
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
    

}
