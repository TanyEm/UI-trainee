//
//  PinCodeViewController.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 10.7.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class PinCodeViewController: UIViewController, UITextFieldDelegate{
    
    var countTimer:Timer!
    var counter = 300
    
    @IBOutlet weak var firstCell: UITextField!
    @IBOutlet weak var secondCell: UITextField!
    @IBOutlet weak var thirdCell: UITextField!
    @IBOutlet weak var fourthCell: UITextField!
    @IBOutlet weak var fifthCell: UITextField!
    @IBOutlet weak var sixthCell: UITextField!
    @IBOutlet weak var sentPin: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var buttonMover: ButtonMover?
    var gestureHendler: GesturesHendler?

    override func viewDidLoad() {
        super.viewDidLoad()
        gestureHendler = GesturesHendler(view: self.view)
        gestureHendler?.gestureRecognizer()
        
        buttonMover = ButtonMover(view: self.view, constraint: self.bottomConstraint)
        guard let mover = buttonMover else {return}
        
        NotificationCenter.default.addObserver(mover,
                                               selector: #selector(mover.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(mover,
                                               selector: #selector(mover.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(mover,
                                               selector: #selector(mover.keyboardWillChangeFrame),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
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
        sentPin.layer.cornerRadius = 20
        
        self.countTimer = Timer.scheduledTimer(timeInterval: 1 ,
        target: self,
        selector: #selector(self.changeButtonTitle),
        userInfo: nil,
        repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let mover = buttonMover else {return}
       
        NotificationCenter.default.removeObserver(mover, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(mover, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(mover, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

    }
    
    @IBAction func moveToPhoneNumber(_ sender: Any) {
        performSegue(withIdentifier: "MoveToChangePhoneNumber", sender: self)
        countTimer?.invalidate()
    }
    
    @IBAction func pinCdeTimer(_ sender: Any) {
       //send code again
    }
    
    @objc func changeButtonTitle()
    {
        // stop blinking
        UIView.setAnimationsEnabled(false)
        if counter != 0 {
            sentPin.isEnabled = false
            sentPin.setTitle("Resend Code in \(timeCounter(time: counter))", for: .normal)
            counter -= 1
            sentPin.backgroundColor = UIColor.white
            sentPin.setTitleColor(UIColor.gray, for: .normal)
            sentPin.titleLabel?.font = sentPin.titleLabel?.font.withSize(17)
         } else {
            countTimer.invalidate()
            sentPin.isEnabled = true
            sentPin.setTitle("Send Code again", for: .normal)
            sentPin.setTitleColor(UIColor.white, for: .normal)
            sentPin.backgroundColor = UIColor.init(red: (90/255.0), green: (190/255.0), blue: (250/255.0), alpha: 1)
         }
        UIView.setAnimationsEnabled(true)
    }
    
    func timeCounter(time: Int) -> String {
        var timeLeft: String
        let minutes = String(time / 60)
        let seconds = time % 60
        //guard let sec = Int(seconds) else { return ""}
        if seconds >= 9 {
            print(seconds)
           timeLeft = minutes + ":" + String(seconds)
        } else {
            timeLeft = minutes + ":" + "0\(seconds)"
        }
        return timeLeft
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField.text?.count)! == 1 && string.count > 0 {
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
                let otp = "\(firstCell.text!)\(secondCell.text!)\(thirdCell.text!)\(fourthCell.text!)\(fifthCell.text!)\(sixthCell.text!)"
                if otp.count == 6 {
                    performSegue(withIdentifier: "moveToUserInfo", sender: self)
                    countTimer?.invalidate()
                }
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

}
