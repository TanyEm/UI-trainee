//
//  PhoneNumberViewController.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 6.7.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit


class PhoneNumberViewController: UIViewController {

    @IBOutlet weak var regionNumber: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var moveNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        regionNumber.layer.cornerRadius = 15
        regionNumber.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        regionNumber.layer.borderWidth = 0
        regionNumber.clipsToBounds = true
        
        let bottomBorder = CALayer()
        let width = CGFloat(1.0)
        bottomBorder.frame = CGRect(x: 0.0, y: regionNumber.frame.size.height - width, width: regionNumber.frame.size.width, height: width)
        bottomBorder.backgroundColor = UIColor.black.cgColor
        regionNumber.layer.addSublayer(bottomBorder)
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: regionNumber.frame.size.width, height: width)
        topBorder.backgroundColor = UIColor.black.cgColor
        regionNumber.layer.addSublayer(topBorder)
        
        let rightBorder = CALayer()
        rightBorder.frame = CGRect(x: regionNumber.frame.size.width - width, y: 0.0, width: width, height: regionNumber.frame.size.height - width)
        rightBorder.backgroundColor = UIColor.black.cgColor
        regionNumber.layer.addSublayer(rightBorder)
        
        
        phoneNumber.layer.cornerRadius = 15
        phoneNumber.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        phoneNumber.layer.borderWidth = 0
        phoneNumber.clipsToBounds = true
        
        moveNext.layer.cornerRadius = 15
                
    }
    
    @IBAction func moveToWelcome(_ sender: Any) {
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
