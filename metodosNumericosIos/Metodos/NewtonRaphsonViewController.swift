//
//  NewtonRaphsonViewController.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 23/10/21.
//

import UIKit

class NewtonRaphsonViewController: UIViewController {
    
    @IBOutlet weak var funcionTextField: UITextField!
    @IBOutlet weak var derivadaTextField: UITextField!
    @IBOutlet weak var initPointTextField: UITextField!
    @IBOutlet weak var errorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
extension NewtonRaphsonViewController:UIMethodViewController{
    func getMethod() -> Method{
        let funcion = funcionTextField.text ?? "x*x-2"
        let derivada = derivadaTextField.text!
        let error=Double(errorTextField.text!)!
        let initPoint = Double(initPointTextField.text!)!
        return NewtonRaphsonMethod(function: funcion, derived: derivada, initPoint: initPoint, error: error)
        
    }
    

    

}
