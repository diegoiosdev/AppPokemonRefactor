import UIKit

extension UILabel {
    
    static func textLabelProject(_ size: CGFloat, textColor:UIColor = .black, numberOfLines: Int = 1 ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        return label
    }
}
