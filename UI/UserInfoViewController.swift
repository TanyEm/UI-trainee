//
//  UserInfoViewController.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 22.7.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var birthdayField: UITextField!
    @IBOutlet weak var goNext: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameField.layer.cornerRadius = 20
        let paddingName = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: 20,
                                               height: self.nameField.frame.height))
        nameField.leftView = paddingName
        nameField.leftViewMode = UITextField.ViewMode.always
        
        birthdayField.layer.cornerRadius = 20
        let paddingBirthday = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: 20,
                                               height: self.birthdayField.frame.height))
        birthdayField.leftView = paddingBirthday
        birthdayField.leftViewMode = UITextField.ViewMode.always
        
        goNext.layer.cornerRadius = 20
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
