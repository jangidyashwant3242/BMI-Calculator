//
//  ViewController.swift
//  BMI Calculator
//
//  Created by w3OnDemand on 16/11/19.
//  Copyright © 2019 w3OnDemand. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    
    @IBOutlet weak var txt_Height: UITextField!
    @IBOutlet weak var txt_Weight: UITextField!
    @IBOutlet weak var lbl_BMI_Result: UILabel!
    @IBOutlet weak var lbl_BMI_Result_Color: UILabel!
    @IBOutlet weak var lbl_BMI_Message: UILabel!
    
    var linkURL = ""
    var BMI_Value = Double()
    //var dict = NSDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txt_Height.delegate = self
        txt_Weight.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func actionManager(_ sender: UIButton) {
        
        if HelperMethod.sharedInstance.emptyChecker(txt_Height.text!)
        {
            txt_Height.text?.removeAll()
            txt_Height.becomeFirstResponder()
            self.showAlert(withTitle: "Please enter your height in (Inches)", message: "")
            //HelperMethod.sharedInstance.makeTostLive(str: "Please enter first name")
        }
        else if HelperMethod.sharedInstance.emptyChecker(txt_Weight.text!)
        {
            txt_Weight.text?.removeAll()
            txt_Weight.becomeFirstResponder()
            self.showAlert(withTitle: "Please enter your weight", message: "")
        }
        else
        {
            let intValue: Int = Int(txt_Weight.text!)!
            let intHeight:Int = Int(txt_Height.text!)!
            BMI_Value = Double(Double(703 * intValue) / Double(intHeight*intHeight))
            
            self.lbl_BMI_Result.text = String(format: "%.2f", BMI_Value)
            screenManager()
        }
        
    }
    
    func screenManager() {
        
        if self.BMI_Value < 18
        {
            self.lbl_BMI_Result_Color.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            self.lbl_BMI_Message.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            lbl_BMI_Message.text = "You are underweight 😟"
        }
        else if self.BMI_Value >= 18 && self.BMI_Value < 25
        {
            self.lbl_BMI_Result_Color.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            self.lbl_BMI_Message.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            lbl_BMI_Message.text = "You are normal 😊"
        }
        else if self.BMI_Value >= 25 && self.BMI_Value < 31
        {
            self.lbl_BMI_Result_Color.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            self.lbl_BMI_Message.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            lbl_BMI_Message.text = "You are pre-obese!"
        }
        else if self.BMI_Value >= 31
        {
            self.lbl_BMI_Result_Color.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            self.lbl_BMI_Message.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            lbl_BMI_Message.text = "You are obese 😟"
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}


//show alert
extension ViewController
{
    func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
        
    }
}
