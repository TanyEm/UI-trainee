//
//  PhotoEditorViewController.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 29.10.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class PhotoEditorViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var usersPhotoImage: UIImageView!
    @IBOutlet weak var photoAdditionButton: UIButton!
        
    //Lets create a struct to have the basic information we need
    struct Item {
        var id: Int
        var name: String
        var x: Double
        var y: Double
    }
    
    //Creating some sample button on the map
    //x and y are based on the original Image size
    let buttonsInfo: Item =
        Item(id: 1, name: "Edit", x: 70, y: 150)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        photoAdditionButton.layer.cornerRadius = 20
        
        usersPhotoImage.layer.cornerRadius = self.usersPhotoImage.frame.width/2.3
        usersPhotoImage.layer.masksToBounds = true
                        
        addEditButton()
    }
    
    @IBAction func movePreviousScreen(_ sender: Any) {
        performSegue(withIdentifier: "MoveToUserInfo", sender: self)
    }
    
    @IBAction func addUserPhoto(_ sender: Any) {
        let messageAlert = MessageAlert()
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source",
                                            message: "Please, choose what kind of type of selecting photo do you prefer",
                                            preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library",
                                            style: .default,
                                            handler: { (UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                messageAlert.showMessage(on: self, with: "Ooops!", message: "Please, give an access to your photo library")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Camera",
                                            style: .default,
                                            handler: { (UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                messageAlert.showMessage(on: self, with: "Ooops!", message: "Please, give an access to your camera")
            }
        }))

        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: { (UIAlertAction) in
            
        }))

        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let size = scaleSizeOfImage()
                
        // get an image from UIImagePickerController and resize
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let resizeldImage = UIKit.resizingImage(at: image, for: size)
        
        DispatchQueue.main.async {
            UIView.transition(with: self.usersPhotoImage, duration: 1.0, options: [.curveEaseOut, .transitionCrossDissolve], animations: {
                self.usersPhotoImage.image = resizeldImage
            }, completion: { _ in
            })
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func scaleSizeOfImage() -> CGSize {
        // Scale size of image view frame by the scale of main UIScreen because in
        // resizedImage(at: image, for: size) size is a measure of point size,
        // rather than pixel size
        let scaleFactor = UIScreen.main.scale
        let scale = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        let size = self.usersPhotoImage.bounds.size.applying(scale)

        return size
    }
    
    func addEditButton() {
        let originalImageSize: CGSize = scaleSizeOfImage()

        //after the image is rendered on UI get the real dimensions
        //Size of the Image that is rendered on UI in proper aspect ratio
        let renderedImageSize: CGSize = CGSize(width: 400, height: 400)
        let xFrameParameter = Double(renderedImageSize.width/originalImageSize.width)*buttonsInfo.x
        let yFramexParameter = Double(renderedImageSize.height/originalImageSize.height)*buttonsInfo.y
        
        let button = UIButton()
        button.tag = buttonsInfo.id
        button.frame = CGRect(x: xFrameParameter,
                              y: yFramexParameter,
                              width: 70,
                              height: 30)
        button.backgroundColor = UIColor(red: 200.0/255.0,
                                         green: 200.0/255.0,
                                         blue: 200.0/255.0,
                                         alpha:0.5)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Compact Rounded Bold", size: 17.0)
        button.layer.cornerRadius = 10
        
        button.setTitle("Edit", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        usersPhotoImage.addSubview(button)
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
            print("Button tapped")
        }
}
