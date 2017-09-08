//
//  LoginVC.swift
//  ChatApp
//
//  Created by Venugopal on 31/08/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import UIKit
import Firebase


class LoginVC: UIViewController {
  
  @IBOutlet weak var password1: UITextField!
  @IBOutlet weak var userId: UITextField!
  var ref:DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
      navigationController?.isNavigationBarHidden = true
       ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
  @IBAction func login(_ sender: Any) {
    
    if self.userId.text == "" || self.password1.text == "" {
      
      //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
      
      let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
      
      let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
      alertController.addAction(defaultAction)
      
      self.present(alertController, animated: true, completion: nil)
      
    } else {
      
      Auth.auth().signIn(withEmail: self.userId.text!, password: self.password1.text!) { (user, error) in
        
        if error == nil {
          
          //Print into the console if successfully logged in
          print("You have successfully logged in")
          
          //Go to the HomeViewController if the login is sucessful
          let listOfUsers = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListOfUsersVC")
            as! ListOfUsersVC
          self.navigationController?.pushViewController(listOfUsers, animated: true)
          
        } else {
          
          //Tells the user that there is an error and then gets firebase to tell them the error
          let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
          
          let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
          alertController.addAction(defaultAction)
          
          self.present(alertController, animated: true, completion: nil)
        }
      }
    }
    
  }
  @IBAction func resetPassword(_ sender: Any) {
    if self.userId.text == "" {
      let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
      
      let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
      alertController.addAction(defaultAction)
      
      present(alertController, animated: true, completion: nil)
      
    } else {
      Auth.auth().sendPasswordReset(withEmail: self.userId.text!, completion: { (error) in
        
        var title = ""
        var message = ""
        
        if error != nil {
          title = "Error!"
          message = (error?.localizedDescription)!
        } else {
          title = "Success!"
          message = "Password reset email sent."
          self.userId.text = ""
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
      })
    }

  }
  @IBAction func retrieve(_ sender: Any) {
     }
    /*
   @IBAction func retrieve(_ sender: Any) {
   }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
