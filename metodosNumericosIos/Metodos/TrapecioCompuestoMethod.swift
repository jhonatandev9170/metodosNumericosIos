//
//  TrapecioCmpuestoMethod.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 25/10/21.
//

import Foundation
class TrapecioCompuestoMethod:Method{
    private let function:String
    private let initPoint:Double
    private let finishPoint:Double
    private let intervalos:Int
    init(function:String ,initPoint:Double ,finishPoint:Double,intervalos:Int) {
        self.function=function
        self.initPoint=initPoint
        self.finishPoint=finishPoint
        self.intervalos=intervalos
    }
    
    func getData() -> [DataModel] {
        var data:[DataModel]=[]
        let h=(finishPoint-initPoint)/Double(intervalos)
        var x = initPoint
        for i in 0...intervalos+1 {
            let fi = Funcs.eval(function: function, x: x)
            var mi:Double  {
                if i==0||i==intervalos {
                    return 1.0
                }else{ return 2.0}
            }
            
            let si = 0.5*fi*h*mi
            data.append(DataModel(data: [
                "i":Double(i),
                "xi":x,
                "fi":fi,
                "M":mi,
                "Si":si
            ]))
            x=x+h
        
        }
        return data
    }
    
    func getDataLabel() -> [String] {
        return ["i","xi","fi","M","Si"]
    }
    
    
}
