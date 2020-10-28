//
//  ButtonWithImage.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 27.10.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation
import UIKit

class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 16, left: (bounds.width - 38), bottom: 16, right: 15)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}
