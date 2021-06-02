//
//  NewApplianceViewController.swift
//  smartHomeEnegry
//
//  Created by Ritik Suryawanshi on 27/05/21.
//

import UIKit
import Firebase

class NewApplianceViewController: UIViewController {

    @IBOutlet var app_name: UITextField!
    
    @IBOutlet var room: UITextField!
    
    @IBOutlet var year: UITextField!
    
    @IBOutlet var avg: UITextField!
    
 
    var x : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPressed(_ sender: Any) {
        
        x = x+1
        
        let flag : String
        
        flag = String(x)
        guard let appnameText = self.app_name.text, !appnameText.isEmpty else { return}
        
            guard let roomText = self.room.text, !roomText.isEmpty else { return}
            guard let yearText = self.year.text, !yearText.isEmpty else { return}
        guard let avgText = self.avg.text, !avgText.isEmpty else { return}
        let values = ["appliance_name": appnameText,"room": roomText, "avg_energy": avgText, "purchase_year" : yearText]
        let val = ["no_of_app": flag]
         Database.database().reference().child("users/appliances").child("\(Auth.auth().currentUser!.uid)").updateChildValues(values) {
           (error:Error?, ref:DatabaseReference) in
           
             if let error = error {
             print("Data could not be saved: \(error).")
           } else {
             print("Data saved successfully!")
           }
         }
        Database.database().reference().child("users").child("\(Auth.auth().currentUser!.uid)").updateChildValues(val) {
          (error:Error?, ref:DatabaseReference) in
          
            if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
