//
//  UITextFields.swift
//  ASCIOS
//
//  Created by Emad Habib on 2/19/20.
//  Copyright © 2020 islam. All rights reserved.
//

import Foundation
import RxCocoa
import UIKit
import RxSwift
import libPhoneNumber_iOS

class EyasTextField: UITextField ,UITextFieldDelegate{
    private let disposeBag = DisposeBag()
    
    
    @IBInspectable var isNationality: Bool  = false {
        didSet {
            if isNationality {
                self._isNationality = isNationality
            }
        }
    }
    
    @IBInspectable var isPassportNumber: Bool  = false {
        didSet {
            if isPassportNumber {
                self._isPassportNumber = isPassportNumber
            }
        }
    }


    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeholderLbl.textColor
        }
        set {
            self.placeholderLbl.textColor = newValue
        }
    }
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    private var usernameLabelYAnchorConstraint: NSLayoutConstraint!
    private var usernameLabelLeadingAnchor: NSLayoutConstraint!
    var isPassowrd = false {
        didSet {
            setup()
        }
    }
    var _isNationality = false
    var _isPassportNumber = false

    var myCountryCode = ""
    private var hasError: Bool = false {
        didSet {
            self.errorHandled.onNext(hasError)
        }
    }
    var errorHandled = PublishSubject<Bool>()
    private lazy var placeholderLbl: UILabel! = {
        let label = UILabel()
        label.text = self.placeholder
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 1
        return label
    }()
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        addSubview(placeholderLbl)
        self.placeholder = nil
        self.delegate = self
        setMaxLength()
        
        self.textAlignment = UserDefaults.isArabic() ? .right : .left
        
        if self.text?.count == 0 {
            self.placeHolderColor = .lightGray
        }
        if isPassowrd{
            self.leftImage = #imageLiteral(resourceName: "showPw")
            self.hasError = false
            self.imageView.isUserInteractionEnabled = true
        }
        self.borderStyle = .none
        configureViews()
        
    }
    
    func updateTextFieldPlaceholder(){
        if let text = self.text , text.count > 0 {
            self.delegate?.textFieldDidBeginEditing?(self)
        }
    }
    
    //Action
    @objc func tapDetected() {
        print("Clicked")
        if self.isSecureTextEntry {
            self.leftImage = #imageLiteral(resourceName: "hidePw")
            self.isSecureTextEntry = false
        }
        else {
            self.leftImage = #imageLiteral(resourceName: "showPw")
            self.isSecureTextEntry = true
        }
    }
    
    func configureViews() {
        //5
        let left = self.rightView?.frame.size.width ?? 0
        let margins = self.layoutMarginsGuide
        usernameLabelYAnchorConstraint = self.placeholderLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        usernameLabelLeadingAnchor = self.placeholderLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            self.widthAnchor.constraint(equalToConstant: 100),
            self.heightAnchor.constraint(equalToConstant: 25),
            usernameLabelYAnchorConstraint,
            usernameLabelLeadingAnchor,
        ])
    }
    
    @IBInspectable var maximumCharacters: Int = 80
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= self.maximumCharacters
    }
    
    private func setMaxLength() {
        addTarget(self, action: #selector(textfieldChanged(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc private func textfieldChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if self.keyboardType == .emailAddress {
            self.maximumCharacters = 150
            if text.validateEmail {
                self.leftImage = nil
                self.placeHolderColor = ColorPalette.mainColor
                self.hasError = false
            }else {
                self.leftImage = #imageLiteral(resourceName: "error")
                self.placeHolderColor = ColorPalette.rouge
                self.hasError = true
            }
        }
        else if self.keyboardType == .asciiCapableNumberPad { // PhoneNumber
            self.maximumCharacters = 12
            if myCountryCode == "KW" {
                self.maximumCharacters = 8
            }
            do {
                let phoneUtil = NBPhoneNumberUtil.sharedInstance()
                if let myNumber = try? phoneUtil?.parse(self.text ?? "", defaultRegion: myCountryCode) {
                    if let isValid = phoneUtil?.isValidNumber(myNumber)  , isValid{
                        print("isValidPhoneNumber")
                        self.leftImage = nil
                        self.placeHolderColor = ColorPalette.mainColor
                        self.hasError = false
                        if let number = myNumber.nationalNumber {
                            self.text = "\(number)"
                        }
                    }else {
                        self.leftImage = #imageLiteral(resourceName: "error")
                        self.placeHolderColor = ColorPalette.rouge
                        self.hasError = true
                    }
                }
            }catch let error {
                print("Error:\(error.localizedDescription)")
                
                self.leftImage = #imageLiteral(resourceName: "error")
                self.placeHolderColor = ColorPalette.rouge
                self.hasError = true
            }
//            if text.validateMobile {
//                self.leftImage = nil
//                self.placeHolderColor = ColorPalette.windowsBlue
//                self.hasError = false
//            }else {
//                self.leftImage = #imageLiteral(resourceName: "error")
//                self.placeHolderColor = ColorPalette.rouge
//                self.hasError = true
//            }
        }
        else if self.keyboardType == .default { // password
            self.maximumCharacters = 200
            if self.isSecureTextEntry {
                self.leftImage = #imageLiteral(resourceName: "showPw")
            }
            else {
                self.leftImage = #imageLiteral(resourceName: "hidePw")
            }
            if isPassowrd {
                self.maximumCharacters = 20
                if text.validatePass {
                    // self.leftImage = nil
                    self.placeHolderColor = ColorPalette.mainColor
                    self.hasError = false
                }else {
                    // self.leftImage = #imageLiteral(resourceName: "error")
                    self.placeHolderColor = ColorPalette.rouge
                    self.hasError = true
                }
            }
            else if isNationality {
                if text.validateTxt {
                    // self.leftImage = nil
                    self.placeHolderColor = ColorPalette.mainColor
                    self.hasError = false
                }else {
                    // self.leftImage = #imageLiteral(resourceName: "error")
                    self.placeHolderColor = ColorPalette.rouge
                    self.hasError = true
                }

            }
            else if _isPassportNumber {
                if text.isValidPassport {
                    // self.leftImage = nil
                    self.placeHolderColor = ColorPalette.mainColor
                    self.hasError = false
                }else {
                    // self.leftImage = #imageLiteral(resourceName: "error")
                    self.placeHolderColor = ColorPalette.rouge
                    self.hasError = true
                }
            }
            else {
                if text.validateName {
                    // self.leftImage = nil
                    self.placeHolderColor = ColorPalette.mainColor
                    self.hasError = false
                }else {
                    // self.leftImage = #imageLiteral(resourceName: "error")
                    self.placeHolderColor = ColorPalette.rouge
                    self.hasError = true
                }
            }
        }
    }
    
    // Provides left padding for images
    //    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
    //        var textRect = super.leftViewRect(forBounds: bounds)
    //        textRect.origin.x += leftPadding
    //        return textRect
    //    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateViewLeft()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            //            updateViewRight()
        }
    }
    
    
    @IBInspectable var leftPadding: CGFloat = 5
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateViewRight()
            updateViewLeft()
        }
    }
    
    func updateViewRight() {
        if let image = rightImage {
            leftViewMode = UITextField.ViewMode.always
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = image//.resizeImage(targetSize: .init(width: 26, height: 26))
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        //        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    func updateViewLeft() {
        if let image = leftImage {
            rightViewMode = UITextField.ViewMode.always
            //   let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image//.resizeImage(targetSize: .init(width: 26, height: 26))
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
            imageView.addGestureRecognizer(singleTap)
            rightView = imageView
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
        
        // Placeholder text color
        //        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    //    override open func textRect(forBounds bounds: CGRect) -> CGRect {
    //        let padding = UIEdgeInsets(top: 0, left: 37.5, bottom: 0, right: 35)
    //        return bounds.inset(by: .zero)
    //    }
    //
    //    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    //        let padding = UIEdgeInsets(top: 0, left: 37.5, bottom: 0, right: 0)
    //        return bounds.inset(by: padding)
    //    }
    //
    //    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    //        let padding = UIEdgeInsets(top: 0, left: 37.5, bottom: 0, right: 35)
    //        return bounds.inset(by: padding)
    //    }
    //
    
}


extension EyasTextField {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        usernameLabelYAnchorConstraint.constant = -18
        //        usernameLabelLeadingAnchor.constant = 0
        performAnimation(transform: CGAffineTransform(scaleX: 1, y: 1))
        self.placeholderLbl.font = Fonts.SegoUI.bold(of: 12)
        if !self.hasError {
            self.placeHolderColor = ColorPalette.mainColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text , text.count == 0 {
            if !isPassowrd{
            self.leftImage = nil
            self.hasError = false
            }
            else {
                self.leftImage = #imageLiteral(resourceName: "showPw")
                self.hasError = false
            }
        }
        if let text = textField.text, text.isEmpty {
            usernameLabelYAnchorConstraint.constant = 0
            //            usernameLabelLeadingAnchor.constant = 5
            performAnimation(transform: CGAffineTransform(scaleX: 1, y: 1))
            self.placeholderLbl.font = Fonts.SegoUI.regular(of: 14)
            self.placeHolderColor = ColorPalette.brownGrey
        }
    }
    
    fileprivate func performAnimation(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.placeholderLbl.transform = transform
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
}


import UIKit
private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        if let t = textField.text {
            textField.text = String(t.prefix(maxLength))
        }
    }
}
