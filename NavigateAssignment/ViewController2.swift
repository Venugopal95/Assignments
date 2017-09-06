//
//  ViewController2.swift
//  NavigateAssignment
//
//  Created by Venugopal on 05/09/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func navigateToView3(_ sender: Any) {
    
    let third = ViewController3(nibName: "ViewController3", bundle: nil)
    let navigationController = UINavigationController(rootViewController: third)
   // navigationController.navigationBar.barTintColor = UIColor.black
    //navigationController.isNavigationBarHidden = false
    self.navigationController?.present(navigationController, animated: true,completion: nil)

    
  }
  
    }
