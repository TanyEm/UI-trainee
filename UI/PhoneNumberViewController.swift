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
        
        regionNumber.layer.cornerRadius = 20
        regionNumber.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        regionNumber.layer.borderWidth = 0
        regionNumber.clipsToBounds = true
                
        let rightBorder = CALayer()
        let width = CGFloat(1.0)
        rightBorder.frame = CGRect(x: 0.0, y: 0.0, width: width, height: phoneNumber.frame.size.height - width)
        rightBorder.backgroundColor = UIColor.lightGray.cgColor
        phoneNumber.layer.addSublayer(rightBorder)
        
        
        phoneNumber.layer.cornerRadius = 20
        phoneNumber.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        phoneNumber.layer.borderWidth = 0
        phoneNumber.clipsToBounds = true
        
        moveNext.layer.cornerRadius = 20
                
    }
    
    @IBAction func moveToWelcome(_ sender: Any) {
        performSegue(withIdentifier: "MoveToWelcome", sender: self)
    }
    
    @IBAction func moveToNextScreen(_ sender: Any) {
        regionNumber.text = "+358"
        phoneNumber.text = "123456789"
        guard let regionCode = regionNumber.text else { return }
        guard let phoneNumber = phoneNumber.text else { return }
        
        let isValid = isPhoneNumerIsValid(code: regionCode, number: phoneNumber)
        if isValid == true {
            performSegue(withIdentifier: "GoNext", sender: self)
        } else {
            displayMessage(userMessage: "Your phone number is empty. Try to fill it again")
        }
    }
    
    func isPhoneNumerIsValid(code: String, number: String) -> Bool {
        let phoneValidation: Bool
        if code.isEmpty && number.isEmpty {
            phoneValidation = false
        } else {
            phoneValidation = true
        }
        return phoneValidation
    }
    
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: userMessage, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
                //Will working when OK tapped
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            })
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
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
