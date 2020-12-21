//
//  UIViewExtensions.swift
//  Now
//
//  Created by islam on 2/9/20.
//  Copyright © 2020 islam. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

//@IBDesignable
//class UIViewX:UIView {
//
//    @IBInspectable
//   override var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//        }
//    }
//
//    @IBInspectable
//   override var borderWidth: CGFloat {
//        get {
//            return layer.borderWidth
//        }
//        set {
//            layer.borderWidth = newValue
//        }
//    }
//
//    @IBInspectable
//   override var borderColor: UIColor? {
//        get {
//            if let color = layer.borderColor {
//                return UIColor(cgColor: color)
//            }
//            return nil
//        }
//        set {
//            if let color = newValue {
//                layer.borderColor = color.cgColor
//            } else {
//                layer.borderColor = nil
//            }
//        }
//    }
//
//    @IBInspectable
//   override var shadowRadius: CGFloat {
//        get {
//            return layer.shadowRadius
//        }
//        set {
//            layer.shadowRadius = newValue
//        }
//    }
//
//    @IBInspectable
//   override var shadowOpacity: Float {
//        get {
//            return layer.shadowOpacity
//        }
//        set {
//            layer.shadowOpacity = newValue
//        }
//    }
//
//    @IBInspectable
//   override var shadowOffset: CGSize {
//        get {
//            return layer.shadowOffset
//        }
//        set {
//            layer.shadowOffset = newValue
//        }
//    }
//
//    @IBInspectable
//   override var shadowColor: UIColor? {
//            get {
//                if let color = layer.shadowColor {
//                    return UIColor(cgColor: color)
//                }
//                return nil
//            }
//            set {
//                if let color = newValue {
//                    layer.shadowColor = color.cgColor
//
//                } else {
//                    layer.shadowColor = nil
//                }
//            }
//
//    }
//
//
//}

//extension UIView {
//    
//    @IBInspectable
//    var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//        }
//    }
//    
//    @IBInspectable
//    var borderWidth: CGFloat {
//        get {
//            return layer.borderWidth
//        }
//        set {
//            layer.borderWidth = newValue
//        }
//    }
//    
//    @IBInspectable
//    var borderColor: UIColor? {
//        get {
//            if let color = layer.borderColor {
//                return UIColor(cgColor: color)
//            }
//            return nil
//        }
//        set {
//            if let color = newValue {
//                layer.borderColor = color.cgColor
//            } else {
//                layer.borderColor = nil
//            }
//        }
//    }
//    
//    @IBInspectable
//    var shadowRadius: CGFloat {
//        get {
//            return layer.shadowRadius
//        }
//        set {
//            layer.shadowRadius = newValue
//        }
//    }
//    
//    @IBInspectable
//    var shadowOpacity: Float {
//        get {
//            return layer.shadowOpacity
//        }
//        set {
//            layer.shadowOpacity = newValue
//        }
//    }
//    
//    @IBInspectable
//    var shadowOffset: CGSize {
//        get {
//            return layer.shadowOffset
//        }
//        set {
//            layer.shadowOffset = newValue
//        }
//    }
//    
//    @IBInspectable
//    var shadowColor: UIColor? {
//            get {
//                if let color = layer.shadowColor {
//                    return UIColor(cgColor: color)
//                }
//                return nil
//            }
//            set {
//                if let color = newValue {
//                    layer.shadowColor = color.cgColor
//                    
//                } else {
//                    layer.shadowColor = nil
//                }
//            }
//        
//    }
//    
//
//}

extension UIView {
  class func fromNib<T: UIView>() -> T {
    return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
  }
}


extension UITabBarController {
    func getImageWithColorPosition(color: UIColor, size: CGSize, lineSize: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let rectLine = CGRect(x: 0, y: size.height-lineSize.height, width: lineSize.width, height: lineSize.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.setFill()
        UIRectFill(rect)
        color.setFill()
        UIRectFill(rectLine)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

class CorneredView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        common()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        common()
    }
    
    func common(){
        self.layer.cornerRadius = 8
        self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.backgroundColor = .white
    }
}

@IBDesignable
class GradientView: UIView {
  @IBInspectable var startColor:  UIColor = .black { didSet { updateColors() }}
  @IBInspectable var endColor:   UIColor = .white { didSet { updateColors() }}
  @IBInspectable var startLocation: Double =  0.05 { didSet { updateLocations() }}
  @IBInspectable var endLocation:  Double =  0.95 { didSet { updateLocations() }}
  @IBInspectable var horizontalMode: Bool = false { didSet { updatePoints() }}
  @IBInspectable var diagonalMode:  Bool = false { didSet { updatePoints() }}
  override public class var layerClass: AnyClass { CAGradientLayer.self }
  var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
  func updatePoints() {
    if horizontalMode {
      gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
      gradientLayer.endPoint  = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
    } else {
      gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
      gradientLayer.endPoint  = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
    }
  }
  func updateLocations() {
    gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
  }
  func updateColors() {
    gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
  }
  override public func layoutSubviews() {
    super.layoutSubviews()
    DispatchQueue.main.async { [weak self] in
      self?.updatePoints()
      self?.updateLocations()
      self?.updateColors()
    }
     
  }
}

extension UIView {
    
    @IBInspectable
    var TopcornerRadius: CGFloat {
       get {
            return layer.cornerRadius
        }
        set {
            roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        }
    }
    @IBInspectable
    var BottomcornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)
        }
    }

    
}
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    func dialNumber(number : String) {
        if let url = URL(string: "tel://\(number)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            // add error message here
        }
    }
}

class RTLButton :UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.transform = MOLHLanguage.isArabic() ? CGAffineTransform.init(rotationAngle: .pi) : .identity
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.transform = MOLHLanguage.isArabic() ? CGAffineTransform.init(rotationAngle: .pi) : .identity
    }
}

class RTLImageView :UIImageView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.transform = MOLHLanguage.isArabic() ? .identity : CGAffineTransform.init(rotationAngle: .pi)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.transform = MOLHLanguage.isArabic() ? .identity : CGAffineTransform.init(rotationAngle: .pi)
    }
}

extension UITextField {
    
}
