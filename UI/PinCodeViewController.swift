//
//  PinCodeViewController.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 10.7.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class PinCodeViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var firstCell: UITextField!
    @IBOutlet weak var secondCell: UITextField!
    @IBOutlet weak var thirdCell: UITextField!
    @IBOutlet weak var fourthCell: UITextField!
    @IBOutlet weak var fifthCell: UITextField!
    @IBOutlet weak var sixthCell: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstCell.delegate = self
        secondCell.delegate = self
        thirdCell.delegate = self
        fourthCell.delegate = self
        fifthCell.delegate = self
        sixthCell.delegate = self
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstCell.layer.cornerRadius = 20
        secondCell.layer.cornerRadius = 20
        thirdCell.layer.cornerRadius = 20
        fourthCell.layer.cornerRadius = 20
        fifthCell.layer.cornerRadius = 20
        sixthCell.layer.cornerRadius = 20
    }
    
    
    @IBAction func moveToPhoneNumber(_ sender: Any) {
        performSegue(withIdentifier: "MoveToChangePhoneNumber", sender: self)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField.text?.count)! < 1 && string.count > 0 {
            switch textField {
            case firstCell:
                secondCell.becomeFirstResponder()
            case secondCell:
                thirdCell.becomeFirstResponder()
            case thirdCell:
                fourthCell.becomeFirstResponder()
            case fourthCell:
                fifthCell.becomeFirstResponder()
            case fifthCell:
                sixthCell.becomeFirstResponder()
            case sixthCell:
                sixthCell.resignFirstResponder()
                print("OTP - \(firstCell.text!)\(secondCell.text!)\(thirdCell.text!)\(fourthCell.text!)\(fifthCell.text!)\(sixthCell.text!)")
            default:
                break
            }
            textField.text = string
            return false

        } else if (textField.text?.count)! >= 1 && string.isEmpty {
            switch textField {
            case sixthCell:
                fifthCell.becomeFirstResponder()
            case fifthCell:
                fourthCell.becomeFirstResponder()
            case fourthCell:
                thirdCell.becomeFirstResponder()
            case thirdCell:
                secondCell.becomeFirstResponder()
            case secondCell:
                firstCell.becomeFirstResponder()
            default:
                break
            }
            textField.text = ""
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        return true
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
