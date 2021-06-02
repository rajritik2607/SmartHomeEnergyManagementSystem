//
//  logInViewController.swift
//  smartHomeEnegry
//
//  Created by Ritik Suryawanshi on 27/05/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class logInViewController: UIViewController {

    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    
    let user_id : String = "1001"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
                if error == nil{
                    guard let emailText = self.email.text, !emailText.isEmpty else { return}
                    guard let passwordText = self.password.text, !passwordText.isEmpty else { return}
                    let values = ["user_id": self.user_id,"email": emailText, "password": passwordText]
                    
                    Database.database().reference().child("users").child("\(Auth.auth().currentUser!.uid)").updateChildValues(values) {
                      (error:Error?, ref:DatabaseReference) in
                      
                        if let error = error {
                        print("Data could not be saved: \(error).")
                      } else {
                        print("Data saved successfully!")
                      }
                    self.performSegue(withIdentifier: "abc1", sender: nil)
                }
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
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
