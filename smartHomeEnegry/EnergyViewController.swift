//
//  EnergyViewController.swift
//  smartHomeEnegry
//
//  Created by Ritik Suryawanshi on 27/05/21.
//

import UIKit
import Firebase

class EnergyViewController: UIViewController {

    var ref : DatabaseReference!
    
    @IBOutlet var energy_con: UILabel!
    
    @IBOutlet var avg_energy: UILabel!
    
    
    @IBOutlet var energy_des: UILabel!
    
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
                  let eneryText = dictionary["energy_consumption"] as! String
                  let avgenergyText = dictionary["avg_ec"] as! String
                  let energydes = dictionary["energy_des"] as! String
                 
                self.energy_con.text = eneryText
                self.avg_energy.text = avgenergyText
                self.energy_des.text = energydes
        // Do any additional setup after loading the view.
    }
             })
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
