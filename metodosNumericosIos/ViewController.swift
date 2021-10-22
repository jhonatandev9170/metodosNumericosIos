//
//  ViewController.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 6/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=""
        // Do any additional setup after loading the view.
    }

    @IBAction func CalculateButton(_ sender: UIButton) {

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newton:NewtonRapson = NewtonRapson(function: "x*x-2", derived: "2*x", initPoint: 2.0, error: 0.0000001)
        if let resultVC = segue.destination as? ResultsViewController {
            resultVC.dataLabel=NewtonRapson.dataLabel
            resultVC.title=NewtonRapson.name
            resultVC.data=newton.calculoRaiz()

        }
    }
    
    
    
}

