//
//  RegistrationVC.swift
//  ChatApp
//
//  Created by Venugopal on 07/09/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import UIKit
import Firebase

class RegistrationVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  var ref:DatabaseReference!
  
  @IBOutlet weak var tableView: UITableView!
  var labels = ["Name","Phone","Email","Password","ConfirmPassword"]
  var textPlaceHolders = ["Name","Phone","Email","Password","ConfirmPassword"]
  var values: [Int:String] = [:]
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.title = "Registration"
    tableView.delegate = self
    tableView.dataSource = self
    ref = Database.database().reference()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    // return 4
    return labels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  RegistrationCell
      else
    {
      fatalError("The dequeued cell is not an instance of MealTableViewCell.")
    }
    cell.tableLabel.text = labels[indexPath.row]
    cell.tableTextField.placeholder = textPlaceHolders[indexPath.row]
    cell.tableTextField.tag = indexPath.row
    cell.tableTextField.resignFirstResponder()
    cell.tableTextField.delegate = self as UITextFieldDelegate
    // cell.textLabel?.text = "hello"
    return cell
  }
  
  
  @IBAction func saveInDatabase(_ sender: Any) {
    
    if values[2] == "" {
      let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
      
      let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
      alertController.addAction(defaultAction)
      
      present(alertController, animated: true, completion: nil)
      
    } else {
      
      if values[3] == values[4]{
        
        Auth.auth().createUser(withEmail: values[2]!, password: values[3]!) { (user, error) in
          
          if error == nil {
            print("You have successfully signed up")
            
            //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
            self.ref.child("users").child(self.values[0]!).setValue([self.labels[1] :self.values[1],self.labels[2] :self.values[2],self.labels[3] : self.values[3],self.labels[4] : self.values[4]] )
            //self.ref.child("users").child(self.values[0]!).setValue([labels[1] :values[1]!],[labels[2] :values[2]!],[labels[3] : values[3]!],[labels[4] : values[4]!] )
            
            
            
            
          } else {
            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
          }
        }
      }else{
        let alert = UIAlertController(title: "Alert", message: "Password and ConfirmPasswords are not Same", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return

      }
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
  }
}
extension RegistrationVC:UITextFieldDelegate{
  public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason){
    
    self.values[textField.tag] = textField.text!
    
  }
}
