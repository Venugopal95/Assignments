//
//  ViewController3.swift
//  NavigateAssignment
//
//  Created by Venugopal on 05/09/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func navigateToView4(_ sender: Any) {
    
    self.dismiss(animated: true, completion: {
      
      let fourthVC = ViewController4(nibName: "ViewController4", bundle: nil)
      if let navigate = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController as? UINavigationController
      {
        navigate.pushViewController(fourthVC, animated: true)
        //self.navigationController?.pushViewController(fourthVC, animated: true)
      }
      
    })
    
   
  }

  
}
