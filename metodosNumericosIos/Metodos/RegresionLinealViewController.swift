//
//  RegresionLinealViewController.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 29/10/21.
//

import UIKit

class RegresionLinealViewController: UIViewController {

    
    @IBOutlet weak var xDataTextField: UITextField!
    @IBOutlet weak var yDataTextField: UITextField!
    @IBOutlet weak var pointTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}
extension RegresionLinealViewController:UIMethodViewController{
    func getMethod() -> Method {
        if(xDataTextField.text! == "" || yDataTextField.text!=="" ){
            return RegresionLinealMethod(xData: [1.0,2.0,3.5,5.2], yData: [3.0,5.9,11.0,16.4], point: 4)
        }else {
            let xData = Funcs.toArray(xDataTextField.text!)
            let yDAta = Funcs.toArray(yDataTextField.text!)
            let point = Double(pointTextField.text!) ?? 0.0
            return RegresionLinealMethod(xData: xData, yData: yDAta, point: point)
        }

    }
    
    
}
