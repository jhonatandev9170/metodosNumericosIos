//
//  ViewController.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 6/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputsView: UIView!
    @IBOutlet weak var methodTextField: UITextField!
    @IBOutlet weak var calculateBtn: UIButton!
    
    var methodPicker: UIPickerView=UIPickerView()
    let method = ["Newton-Raphson" ,"Biseccion" ,"Secante" ]
    
    var currentViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Encontrar Raiz"
        
        methodPicker.dataSource=self
        methodPicker.delegate=self
        
        methodTextField.inputView = methodPicker
        
        calculateBtn.isHidden=true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newton = NewtonRaphson(function: "x*x-2", derived: "2*x", initPoint: 2.0, error: 0.0000001)
        return
        if let resultVC = segue.destination as? ResultsViewController {
            resultVC.dataLabel=NewtonRaphson.dataLabel
            resultVC.title=methodTextField.text
            resultVC.data=newton.calculoRaiz()

        }
    }
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        inputsView.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = inputsView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    private func removeCurrentViewController() {
        
            if let vc = currentViewController{
                // Notify Child View Controller
                vc.willMove(toParent: nil)

                // Remove Child View From Superview
                vc.view.removeFromSuperview()

                // Notify Child View Controller
                vc.removeFromParent()
            }
        // Notify Child View Controller

    }


}

extension ViewController:UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return method.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return method[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //self.title = method[row]
        methodTextField.text=method[row]
        //self.title=method[row]
        methodTextField.resignFirstResponder()
        removeCurrentViewController()
        calculateBtn.isHidden=true
        //let vc = UIMethodViewControllerFactory.buildUIMethod(method: method[row])
        if let vc = UIMethodViewControllerFactory.buildUIMethod(method: method[row]){
            add(asChildViewController: vc )
            calculateBtn.isHidden=false
        }
        
    }
    
}

