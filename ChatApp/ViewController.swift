//
//  ViewController.swift
//  ChatApp
//
//  Created by Venugopal on 31/08/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import UIKit

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    IJProgressView.shared.showProgressView(view)
    
    setCloseTimer()
    
    
    
  }
  
  func close() {
    IJProgressView.shared.hideProgressView()
    let login = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"Login") as! Login
    
    self.navigationController?.pushViewController(login, animated: true)
    
    
    
  }
  
  func setCloseTimer() {
    _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(close), userInfo: nil, repeats: false)
  }
  
  
}

