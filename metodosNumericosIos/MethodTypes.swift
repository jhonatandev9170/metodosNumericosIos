//
//  MethodTypes.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 26/10/21.
//

import Foundation
class MethodTypes{
    static let methodTypes = ["Ecuaciones No Lineales","Interpolacion","Integral"]
    static func getMethodName(methodType:String)->[String]
    {
        switch methodType{
            
        case "Ecuaciones No Lineales":
            return ["Newton-Raphson","Biseccion","Secante","Punto Fijo"]
            
        case "Interpolacion" :
            return ["Diferencias Divididas Newton" ,"Metodo Lagrange","Regresion Lineal"]
        
        case "Integral" :
            return ["Trapecio Compuesto","Simpson 1/3 Compuesto","Simpson 3/8"]
        
        default :
            return []
        }
    }
    
    
    
    
}
