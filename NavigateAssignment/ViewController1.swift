//
//  ViewController1.swift
//  NavigateAssignment
//
//  Created by Venugopal on 05/09/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

  @IBAction func View2(_ sender: Any) {
    let second = ViewController2(nibName: "ViewController2", bundle: nil)
    let navigationController = UINavigationController(rootViewController: second)
    navigationController.navigationBar.barTintColor = UIColor.black
    navigationController.isNavigationBarHidden = false
    
    self.navigationController?.pushViewController(second, animated: true)
    
  }
}
