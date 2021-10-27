//
//  BiseccionViewController.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 25/10/21.
//

import UIKit

class BiseccionViewController: UIViewController,UIMethodViewController {
    @IBOutlet weak var funcionTextField: UITextField!
    @IBOutlet weak var initPointTextField: UITextField!
    @IBOutlet weak var finishPointTextField: UITextField!
    @IBOutlet weak var errorTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func getMethod() -> Method {
        let funcion = funcionTextField.text!
        let initPoint = Double(initPointTextField.text!)!
        let finishPoint = Double(finishPointTextField.text!)!
        let error=Double(errorTextField.text!)!
        return BiseccionMethod(function: funcion, initPoint: initPoint, finishPoint: finishPoint, error: error)
    }
    
}
