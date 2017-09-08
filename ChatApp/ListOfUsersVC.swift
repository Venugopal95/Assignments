//
//  ListOfUsersVC.swift
//  ChatApp
//
//  Created by Venugopal on 04/09/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import UIKit
import Firebase

class ListOfUsersVC : UIViewController{
  
  @IBOutlet weak var tableView: UITableView!
  var searchActive : Bool = false
   var filtered:[String] = []
  @IBOutlet weak var searchBar: UISearchBar!
  var ref : DatabaseReference!
  var emails:[String] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    ref = Database.database().reference()
    tableView.delegate = self
    tableView.dataSource = self
   searchBar.delegate = self

    self.ref.child("users")
      .observeSingleEvent(of: .value , with: { snapshot in
        
        if snapshot.exists() {
          
          let recent = snapshot.value as!  NSDictionary
          
          print(recent.allKeys)
          self.emails = recent.allKeys as! [String]
          self.tableView.reloadData()
          
        }
        
      })
    print(emails)

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
}


extension ListOfUsersVC: UITableViewDelegate,UITableViewDataSource{

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
   func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
   
    
    return 1
  }
  
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    if(searchActive){
      return filtered.count
    }
    return emails.count
  }
  
  
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    print(emails)
    if(searchActive){
      cell.textLabel?.text = filtered[indexPath.row]
    } else {
      cell.textLabel?.text = emails[indexPath.row]
    }
  
    
      
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  let chatwindowVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChatWindowVC") as! ChatWindowVC
    self.navigationController?.pushViewController(chatwindowVC, animated: true)
    
  }
  
  
}
extension ListOfUsersVC : UISearchBarDelegate
{
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchActive = true;
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchActive = false;
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchActive = false;
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchActive = false;
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    filtered = emails.filter({ (text) -> Bool in
      let tmp: NSString = text as NSString
      let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
      return range.location != NSNotFound
    })
    if(filtered.count == 0){
      searchActive = false;
    } else {
      searchActive = true;
    }
    self.tableView.reloadData()
  }}


