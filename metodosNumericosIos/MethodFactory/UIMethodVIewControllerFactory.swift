//
//  UIMethodVIewControllerFactory.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 25/10/21.
//
import UIKit
class UIMethodViewControllerFactory{
    static func buildUIMethod(method: String)->UIViewController?{
        switch method {
        case "Newton-Raphson":
            return NewtonRaphsonViewController()
        case "Biseccion":
            return BiseccionViewController()
            
        default:
            return nil
        }
        
    }
}
