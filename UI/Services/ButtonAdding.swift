import UIKit

class ButtonAdding {
    
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
    
    func addEditButton(size: CGSize, imageView: UIImageView) {
        let originalImageSize: CGSize = size

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

        imageView.addSubview(button)
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
            print("Button tapped")
        }
}
