//
//  BMIResultViewController.swift
//  BMI Calculator
//
//  Created by w3OnDemand on 16/11/19.
//  Copyright © 2019 w3OnDemand. All rights reserved.
//

import UIKit
import SafariServices

class BMIResultViewController: UIViewController {

    @IBOutlet weak var lbl_BMI_Value: UILabel!
    @IBOutlet weak var lbl_BMI_Message: UILabel!
    
    var link = String()
    var BMI_Value = Double()
    var dict = NSDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Your BMI"
        self.navigationItem.hidesBackButton = false
        self.navigationController?.isNavigationBarHidden = false
        
        //MARK :- Data parsing
        self.lbl_BMI_Value.text = String(format: "%.2f", BMI_Value)//String()
        screenManager()
    }
    
    func screenManager() {
        
        if self.BMI_Value < 18
        {
            self.lbl_BMI_Value.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            self.lbl_BMI_Message.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            lbl_BMI_Message.text = "You are underweight 😟"
        }
        else if self.BMI_Value >= 18 && self.BMI_Value < 25
        {
            self.lbl_BMI_Value.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            self.lbl_BMI_Message.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            lbl_BMI_Message.text = "You are normal 😊"
        }
        else if self.BMI_Value >= 25 && self.BMI_Value < 31
        {
            self.lbl_BMI_Value.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            self.lbl_BMI_Message.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            lbl_BMI_Message.text = "You are pre-obese!"
        }
        else if self.BMI_Value >= 31
        {
            self.lbl_BMI_Value.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            self.lbl_BMI_Message.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            lbl_BMI_Message.text = "You are obese 😟"
        }
        
    }
    
    @IBAction func actionManager_WebLink(_ sender: UIButton) {
        
        //link
        let svc = SFSafariViewController(url: URL(string: link)!)
        present(svc, animated: true, completion: nil)
    }
    
}
