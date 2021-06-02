//
//  ViewApplianceViewController.swift
//  smartHomeEnegry
//
//  Created by Ritik Suryawanshi on 27/05/21.
//

import UIKit
import Firebase

class ViewApplianceViewController: UIViewController {
    var ref : DatabaseReference!
    @IBOutlet var app1: UILabel!
    
    @IBOutlet var app2: UILabel!
    
    @IBOutlet var app3: UILabel!
    
    
    @IBOutlet var app4: UILabel!
    
    @IBOutlet var app5: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let uid = Auth.auth().currentUser?.uid else
             {
                 return
             }
             ref = Database.database().reference()
             let userReference = ref.child("users").child(uid)
             
             userReference.observeSingleEvent(of: .value, with: { (snapshot) in
             
             if let dictionary = snapshot.value as? [String: AnyObject]
              {
                  let app1Text = dictionary["app1"] as! String
                  let app2Text = dictionary["app2"] as! String
                  let app3Text = dictionary["app3"] as! String
                  let app4Text = dictionary["app4"] as! String
                  let app5Text = dictionary["app5"] as! String
                 
                self.app1.text = app1Text
                self.app2.text = app2Text
                self.app3.text = app3Text
                self.app4.text = app4Text
                self.app5.text = app5Text
        // Do any additional setup after loading the view.
    }
             })
        

        // Do any additional setup after loading the view.
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
