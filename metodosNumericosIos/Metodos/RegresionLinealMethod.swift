//
//  RegresionLinealMethod.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 29/10/21.
//

import Foundation
import UIKit
class RegresionLinealMethod:Method{
    
    private let xData:[Double]
    private let yData:[Double]
    private let point :Double
    private var result:[Double]=[]
    
    private var a=0.0
    private var b=0.0
    private var n:Int{
        return xData.count}
    private var Sx=0.0
    private var Sy=0.0
    private var Sxy=0.0
    private var Sx2=0.0
    
    init(xData:[Double], yData:[Double],point :Double) {
        self.xData=xData
        self.yData=yData
        self.point=point
        
    }

    func getData() -> [DataModel] {

        var data:[DataModel]=[]
        for i in 0...n-1
        {
            let x=xData[i]
            let y=yData[i]
            data.append(DataModel(data: [
                "x":x,
                "y":y,
                "xy":x*y,
                "x^2":x*x
            ]))
            Sx=Sx+x
            Sy=Sy+y
            Sxy=Sxy+x*y
            Sx2=Sx2+x*x
        }
        return data
    }
    
    func getDataLabel() -> [String] {
        ["x","y","xy","x^2",]
    }
    
    func getResultLabel() -> [String] {
        ["n","Σx","Σy","Σxy","a","b","f(\(point))"]
    }
    
    func getResult() -> [Double] {
        let num:Double = Double(n)
        a = (num*Sxy-Sx*Sy)/(num*Sx2-Sx*Sx)
        b = (Sy-a*Sx)/num
        let f=a*point+b
        return [num,Sx,Sy,Sxy,a,b,f]
    }
    
    
    
    
    
    
    
    
    
}
