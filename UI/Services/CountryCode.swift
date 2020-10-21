//
//  CountryCode.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 20.10.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation
import UIKit

class CountryCode {
    static var codes:[String] = [
        "+358",
        "+7",
        "+3"
    ]
    
    var picker = UIPickerView()
    
    func makePicker(field: UITextField) {
        field.inputView = picker
        
    }
}
