//
//  profileViewController.swift
//  smartHomeEnegry
//
//  Created by Ritik Suryawanshi on 28/05/21.
//

import UIKit
import Firebase




class profileViewController: UIViewController {

    @IBOutlet var name: UILabel!
    
    @IBOutlet var email: UILabel!
    
    @IBOutlet var user_id: UILabel!
    
    @IBOutlet var bill: UILabel!
    
    
    @IBOutlet var noa: UILabel!
    var ref : DatabaseReference!
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
                  let nameText = dictionary["name"] as! String
                  let emailText = dictionary["email"] as! String
                  let useridText = dictionary["user_id"] as! String
                  let billText = dictionary["bill_amount"] as! String
                  let noaText = dictionary["no_of_app"] as! String
                 
                self.name.text = nameText
                self.email.text = emailText
                self.user_id.text = useridText
                self.bill.text = billText
                self.noa.text = noaText
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
    @IBAction func signOutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do
        {
            try firebaseAuth.signOut()
            print("signedOut")
        }
        catch let signOutError as NSError {
            print("Error signing Out: %@", signOutError)
        }
    }
    

}
