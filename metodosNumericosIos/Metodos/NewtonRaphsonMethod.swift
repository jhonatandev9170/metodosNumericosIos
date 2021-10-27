//
//  NewtonMethod.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 19/10/21.
//

import Foundation
class NewtonRaphsonMethod:Method{

    
    private let function:String
    private let derived:String
    private let error:Double
    private let initPoint:Double
    
    init(function:String ,derived:String,initPoint:Double ,error:Double) {
        self.function=function
        self.derived=derived
        self.initPoint=initPoint
        self.error=error
    }
    
    func getData() -> [DataModel] {
        var errorCalc=initPoint
        var root=initPoint
        var rootprev:Double
        var data:[DataModel]=[]
        var i = 0.0
        while abs(errorCalc) >= error {
            i=i+1;
            rootprev=root
            let fi=Funcs.eval(function: function, x: root)
            let di=Funcs.eval(function: derived, x: root)
            root=root - fi/di
            errorCalc=(root-rootprev)/root
            data.append(DataModel(data: [
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
    func getDataLabel() -> [String] {
        return ["iteracion","xi","f(i)","d(i)","xi+1","error"]
    }
    

}
