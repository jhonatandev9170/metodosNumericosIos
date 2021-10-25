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

        // Do any additional setup after loading the view.
    }
    

}
extension NewtonRaphsonViewController:UIMethodViewController{
    func printResults() {
        
    }
}
