//
//  ViewController.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 1.7.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToNextScreen(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        goButton.layer.cornerRadius = 25
        
    }

}

