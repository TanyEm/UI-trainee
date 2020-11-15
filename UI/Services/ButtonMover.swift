//
//  MoveButtonUp.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 28.10.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation
import UIKit

class ButtonMover {
    
    var constraint: NSLayoutConstraint?
    var view: UIView?
    
    init(view: UIView, constraint: NSLayoutConstraint) {
        self.view = view
        self.constraint = constraint
    }
    
    @objc func keyboardWillChangeFrame(notification: NSNotification) {
        print("keyboardWillChangeFrame_moveButtonUp")
        if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let height = frame.cgRectValue.height
            print("keyboard height: \(height)")
            self.constraint?.constant = height
            self.view?.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        print("keyboardWillShow_moveButtonUp")
        if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let height = frame.cgRectValue.height
            self.constraint?.constant = height
            self.view?.layoutIfNeeded()
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        print("keyboardWillHide_moveButtonUp")
        self.constraint?.constant = 30
        self.view?.layoutIfNeeded()
    }
}

