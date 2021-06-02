//
//  ApplianceViewController.swift
//  smartHomeEnegry
//
//  Created by Ritik Suryawanshi on 27/05/21.
//

import UIKit

class ApplianceViewController: UIViewController {

    @IBOutlet var add: UIButton!
    
    @IBOutlet var viewButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleHollowButton(add)
        styleHollowButton(viewButton)
        // Do any additional setup after loading the view.
    }
    
    func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.link.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.link
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

