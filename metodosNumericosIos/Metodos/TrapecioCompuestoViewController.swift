//
//  TrapecioCompuestoViewController.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 25/10/21.
//

import UIKit

class TrapecioCompuestoViewController: UIViewController {

    @IBOutlet weak var funcionTextField: UITextField!
    @IBOutlet weak var intervalosTextField: UITextField!
    @IBOutlet weak var initPointTextField: UITextField!
    @IBOutlet weak var finishPointTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
extension TrapecioCompuestoViewController : UIMethodViewController{
    func getMethod() -> Method {
        let funcion = Funcs.getFuncion(funcionTextField.text)
        let initPoint=Double(initPointTextField.text!) ?? 1.0
        let finishPoint = Double(finishPointTextField.text!) ?? 1.0
        let intervalos = Int(intervalosTextField.text!) ?? 1
        return TrapecioCompuestoMethod(function: funcion, initPoint: initPoint, finishPoint: finishPoint, intervalos: intervalos)
    }
    
    
}
