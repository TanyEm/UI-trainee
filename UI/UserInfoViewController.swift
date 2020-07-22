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
        birthdayField.layer.cornerRadius = 20
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
