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
    @IBOutlet weak var methodTypeTextField: UITextField!
    @IBOutlet weak var calculateBtn: UIButton!
    
    let methodPicker = UIPickerView()
    let methodTypePicker = UIPickerView()
    
    var methodType:[String] = []
    var methodName:[String] = []
    var method:Method!
    
    
    var currentViewController: UIMethodViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Metodos Numericos"
        methodType = MethodTypes.methodTypes
        
        methodTypePicker.delegate=self
        methodTypePicker.dataSource=self
        methodTypeTextField.inputView = methodTypePicker
        methodTypePicker.tag = 1
        methodPicker.dataSource=self
        methodPicker.delegate=self
        methodTextField.inputView = methodPicker
        methodPicker.tag = 2
        
        calculateBtn.isHidden=true
        
        
    }
    func addMethodView(methodName:String){
        removeCurrentViewController()
        calculateBtn.isHidden=true
        currentViewController = UIMethodViewControllerFactory.buildUIMethod(method: methodName)
        if let vc =  currentViewController{
            add(asChildViewController: vc )
            calculateBtn.isHidden=false
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let method = currentViewController?.getMethod()
        let resultVC = segue.destination as! ResultsViewController
        resultVC.dataLabel=method!.getDataLabel()
        resultVC.title=methodTextField.text
        resultVC.data=method!.getData()
        resultVC.result=method!.getResult()
        resultVC.resultLabel=method!.getResultLabel()


    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)

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
        switch pickerView.tag{
        case 1 :
            return methodType.count
        case 2 :
            return methodName.count
        default:
            return 1
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 1 :
            return methodType[row]
        case 2 :
            return methodName[row]
        default:
            return "No data"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //self.title = method[row]
        switch pickerView.tag{
        case 1 :
            methodTypeSelected(row)
        case 2 :
            methodSelected(row)
        default:
            calculateBtn.isHidden=false
        }

    }
    func methodTypeSelected (_ row:Int){
        methodTypeTextField.text = methodType[row]
        methodTypeTextField.resignFirstResponder()
        methodName =  MethodTypes.getMethodName(methodType: methodType[row])
        methodTextField.text = nil
        removeCurrentViewController()
    }
    func methodSelected (_ row:Int){
        methodTextField.text = methodName[row]
        methodTextField.text=methodName[row]
        addMethodView(methodName: methodName[row])
        methodTextField.resignFirstResponder()

    }
    
}

