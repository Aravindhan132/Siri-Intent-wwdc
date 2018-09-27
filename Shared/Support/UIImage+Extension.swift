 

import UIKit

extension UIImageView {
    public func applyRoundedCorners() {
        layer.cornerRadius = 8
        clipsToBounds = true
    }
}
