//
//  BillViewController.swift
//  smartHomeEnegry
//
//  Created by Ritik Suryawanshi on 27/05/21.
//

import UIKit
import Firebase

class BillViewController: UIViewController {
    var ref : DatabaseReference!
    @IBOutlet var bill: UILabel!
    
    
    @IBOutlet var bill_status: UILabel!
    
    @IBOutlet var avg_bill: UILabel!
    
    @IBOutlet var bill_des: UILabel!
    
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
                  let billText = dictionary["bill_amount"] as! String
                  let billavgText = dictionary["avg_bill"] as! String
                  let billstatusText = dictionary["bill_status"] as! String
                  let billdes = dictionary["bill_des"] as! String
                 
                self.bill.text = billText
                self.bill_status.text = billstatusText
                self.bill_des.text = billdes
                self.avg_bill.text = billavgText
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
