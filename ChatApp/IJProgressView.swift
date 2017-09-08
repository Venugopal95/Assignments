//
//  IJProgressView.swift
//  ChatApp
//
//  Created by Venugopal on 31/08/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import UIKit

open class IJProgressView {
  
  var containerView = UIView()
  var progressView = UIView()
  var activityIndicator = UIActivityIndicatorView()
  
  open class var shared: IJProgressView {
    struct Static {
      static let instance: IJProgressView = IJProgressView()
    }
    return Static.instance
  }
  
  open func showProgressView(_ view: UIView) {
    containerView.frame = view.frame
    containerView.center = view.center
    containerView.backgroundColor = UIColor(hex: 0xffffff, alpha: 0.3)
    
    progressView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    progressView.center = view.center
    progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
    progressView.clipsToBounds = true
    progressView.layer.cornerRadius = 10
    
    activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    activityIndicator.activityIndicatorViewStyle = .whiteLarge
    activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
    
    progressView.addSubview(activityIndicator)
    containerView.addSubview(progressView)
    view.addSubview(containerView)
    
    activityIndicator.startAnimating()
  }
  
  open func hideProgressView() {
    activityIndicator.stopAnimating()
    containerView.removeFromSuperview()
  }
}

extension UIColor {
  
  convenience init(hex: UInt32, alpha: CGFloat) {
    let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
    let green = CGFloat((hex & 0xFF00) >> 8)/256.0
    let blue = CGFloat(hex & 0xFF)/256.0
    
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
