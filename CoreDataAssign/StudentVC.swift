//
//  CollegeVC.swift
//  CoreDataAssign
//
//  Created by Venugopal on 01/09/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import UIKit
import CoreData
class StudentVC: UIViewController {

  @IBOutlet weak var studentAge: UITextField!
  @IBOutlet weak var studentName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchStudent()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func save(_ sender: Any) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
    
    context.perform {
      let studentEntity: Student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
      
      studentEntity.name = self.studentName.text
      studentEntity.age = self.studentAge.text
      
      do {
        try context.save()
      }
      catch let error {
        print(error)
      }
    }

  }


  func fetchStudent() {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request = NSFetchRequest<Student>(entityName: "Student")
    //let predicate = NSPredicate(format: "College.collegeName ==%@", "cit")
    //let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
    
   // request.predicate = predicate
    //request.sortDescriptors = [sortDescriptor]
    
    do {
      let objects = try context.fetch(request)
      
      print(objects)
      for item in objects {
        print(item.name ?? "")
        print(item.age)
      }
    }
    catch {
      
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
