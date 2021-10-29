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
        let funcion = Funcs.getFuncion(funcionTextField.text)
        let derivada = Funcs.getFuncion(derivadaTextField.text)
        let error=Double(errorTextField.text!) ?? 2.0
        let initPoint = Double(initPointTextField.text!) ?? 1.0
        return NewtonRaphsonMethod(function: funcion, derived: derivada, initPoint: initPoint, error: error)
        
    }
    

    

}
