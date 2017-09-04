//
//  ViewController.swift
//  CoreDataAssign
//
//  Created by Venugopal on 01/09/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  @IBOutlet weak var collegeName: UITextField!

  @IBOutlet weak var collegeId: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func viewStudents(_ sender: Any) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request = NSFetchRequest<Student>(entityName: "Student")
    //let predicate = NSPredicate(format: "name CONTAINS[cd] %@", "name")
    //let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
    
    // request.predicate = predicate
    //request.sortDescriptors = [sortDescriptor]
    
    do {
      let studentTVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ListOfStudentsTVC") as! ListOfStudentsTVC
      let objects = try context.fetch(request)
      studentTVC.students = objects
      self.navigationController?.pushViewController(studentTVC, animated: true)
      
      }
    catch {
      
    }
  }


  
  @IBAction func addCollege(_ sender: Any) {
    print("fgfjh")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
    
    context.perform {
      let collegeEntity: College = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
      
      collegeEntity.collegeName = self.collegeName.text
      collegeEntity.collegeId = self.collegeId.text
      
      
      do {
        try context.save()
        
        

      }
      catch let error {
        print(error)
      }
      
     
    }
    let studentVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"StudentVC") as! StudentVC
    
    self.navigationController?.pushViewController(studentVC, animated: true)
    
  }
   
  func fetchStudent() {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request = NSFetchRequest<College>(entityName: "College")
    
    //let predicate = NSPredicate(format: "name CONTAINS[cd] %@", "name")
    //let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
    
   // request.predicate = predicate
    //request.sortDescriptors = [sortDescriptor]
    
    do {
      let objects = try context.fetch(request)
      
      print(objects)
      for item in objects {
        print(item.collegeName ?? "")
        print(item.collegeId)
      }
    }
    catch {
      
    }
  }
  



}

