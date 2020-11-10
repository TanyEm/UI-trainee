import UIKit

struct ButtonAdding {
    
    static func makeButton(size: CGSize, title: String, x: Double, y: Double, width: Double, height: Double) -> UIButton {
        let originalImageSize: CGSize = size
        //after the image is rendered on UI get the real dimensions
        //Size of the Image that is rendered on UI in proper aspect ratio
        let renderedImageSize: CGSize = size
        let xFrameParameter = Double(renderedImageSize.width/originalImageSize.width) * x
        let yFramexParameter = Double(renderedImageSize.height/originalImageSize.height) * y
        
        let button = UIButton()
        button.frame = CGRect(x: xFrameParameter,
                              y: yFramexParameter,
                              width: width,
                              height: height)
        button.backgroundColor = UIColor(red: 200.0/255.0,
                                         green: 200.0/255.0,
                                         blue: 200.0/255.0,
                                         alpha:0.5)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Compact Rounded Bold", size: 17.0)
        button.layer.cornerRadius = 10
        
        button.setTitle(title, for: .normal)

        return button
    }

}
