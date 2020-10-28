//
//  GesturesHendler.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 28.10.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class GesturesHendler {
    var view: UIView?
    
    init(view: UIView) {
        self.view = view
    }
    
    func gestureRecognizer() {
        // hide keyboad when user taps on view
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view?.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view?.endEditing(true)
    }
}
