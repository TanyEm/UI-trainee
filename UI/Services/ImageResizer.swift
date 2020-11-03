
import UIKit

enum UIKit {
    static func resizingImage(at img: UIImage, for size: CGSize) -> UIImage? {
        
        /*
        Draw into a UIGraphicsImageRenderer context to render a scaled-down
        version of that image
        The image method takes a closure argument and returns a bitmap that
        results from executing the passed closure. In this case, the result
        is the original image scaled down to draw within the specified bounds.
         */
        
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            img.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
