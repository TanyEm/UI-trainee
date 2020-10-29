//
//  PhotoEditorViewController.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 29.10.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class PhotoEditorViewController: UIViewController {
    
    
    @IBOutlet weak var goNext: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func movePreviousScreen(_ sender: Any) {
        performSegue(withIdentifier: "MoveToUserInfo", sender: self)
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
