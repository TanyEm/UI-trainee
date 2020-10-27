//
//  RightSideTextFieldArrow.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 27.10.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation
import UIKit

class TextFieldArrowOnTheRightSide {
    
    func makeArrow (field: UITextField){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 18, width: 20, height: 15))
        let image = #imageLiteral(resourceName: "arrow-down")
        imageView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 50))
        iconContainerView.addSubview(imageView)
        field.rightView = iconContainerView
        field.rightViewMode = .always
    }
}
