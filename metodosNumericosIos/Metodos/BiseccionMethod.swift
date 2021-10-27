//
//  BiseccionMethod.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 25/10/21.
//

import Foundation
class BiseccionMethod:Method {
    private let function:String
    private let error:Double
    private let initPoint:Double
    private let finishPoint:Double
    init(function:String ,initPoint:Double ,finishPoint:Double,error:Double) {
        self.function=function
        self.initPoint=initPoint
        self.finishPoint=finishPoint
        self.error=error
    }
    func getDataLabel() -> [String] {
        return ["iteracion","x1","xr","x2","f(x1)","f(xr)","f(x2)","error"]
    }
    func getData() -> [DataModel] {
        var errorCalc=initPoint+2.34512
        var x1 = initPoint
        var x2 = finishPoint
        var root=(x1+x2)/2
        var rootprev:Double
        var data:[DataModel]=[]
        var i = 0.0
        while abs(errorCalc) >= error {
            
            i=i+1;
            rootprev=root
            let f1=Funcs.eval(function: function, x: x1)
            let fr=Funcs.eval(function: function, x: root)
            let f2=Funcs.eval(function: function, x: x2)
            data.append(DataModel(data: [
                "iteracion":i,
                "x1":x1,
                "xr":root,
                "x2":x2,
                "f(x1)":f1,
                "f(xr)":fr,
                "f(x2)":f2,
                "error":errorCalc
            ]))
            if f1*fr<=0.0 {
                x2=root
            }
            if f2*fr<=0.0{
                x1=root
            }
            root=(x1+x2)/2
            errorCalc=(root-rootprev)/root

        }
        return data
    }

    
    
    
}
