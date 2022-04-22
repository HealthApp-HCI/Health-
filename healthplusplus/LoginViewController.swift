//
//  LoginViewController.swift
//  healthplusplus
//
//  Created by Axel Siliezar on 4/13/22.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
   
    @IBOutlet weak var imgImage: UIImageView!
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didRecieveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}
