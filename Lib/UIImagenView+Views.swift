import UIKit

extension UIImageView {
    
    static func imageViewProject(named: String? = nil ) -> UIImageView {
        let imageView = UIImageView()
        if let named = named {imageView.image = UIImage(named: named)}
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }
}

