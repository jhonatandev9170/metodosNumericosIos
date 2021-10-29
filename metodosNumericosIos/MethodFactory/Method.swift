//
//  Method.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 25/10/21.
//

import Foundation
protocol Method{
    func getData()->[DataModel]
    func getDataLabel()->[String]
    func getResultLabel()->[String]
    func getResult()->[Double]
}
