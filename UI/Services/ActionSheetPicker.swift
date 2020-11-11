////
////  ActionSheetMaker.swift
////  UI
////
////  Created by Tatiana Podlesnykh on 13.11.2020.
////  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
////
//
//import UIKit
//
//struct ActionSheetPicker {
//    let messageAlert = MessageAlert()
//    let imagePicker = UIImagePickerController()
//    imagePicker.delegate = self
//    
//    let actionSheet = UIAlertController(title: "Photo Source",
//                                        message: "Please, choose what kind of type of selecting photo do you prefer",
//                                        preferredStyle: .actionSheet)
//    
//    actionSheet.addAction(UIAlertAction(title: "Photo Library",
//                                        style: .default,
//                                        handler: { (UIAlertAction) in
//        
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
//            imagePicker.sourceType = .photoLibrary
//            self.present(imagePicker, animated: true, completion: nil)
//        } else {
//            messageAlert.showMessage(on: self, with: "Ooops!", message: "Please, give an access to your photo library")
//        }
//    }))
//    
//    actionSheet.addAction(UIAlertAction(title: "Camera",
//                                        style: .default,
//                                        handler: { (UIAlertAction) in
//        
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            imagePicker.sourceType = .camera
//            self.present(imagePicker, animated: true, completion: nil)
//        } else {
//            messageAlert.showMessage(on: self, with: "Ooops!", message: "Please, give an access to your camera")
//        }
//    }))
//
//    actionSheet.addAction(UIAlertAction(title: "Cancel",
//                                        style: .cancel,
//                                        handler: { (UIAlertAction) in
//        
//    }))
//
//    self.present(actionSheet, animated: true, completion: nil)
//}
