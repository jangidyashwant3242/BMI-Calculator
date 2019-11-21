//
//  LaunchScreenViewController.swift
//  BMI Calculator
//
//  Created by w3OnDemand on 16/11/19.
//  Copyright © 2019 w3OnDemand. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
        
            let pushViewController:ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as!ViewController
            self.navigationController?.pushViewController(pushViewController, animated: true)
        })
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
