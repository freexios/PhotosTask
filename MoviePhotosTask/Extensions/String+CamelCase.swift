//
//  String+CamelCase.swift
//  MovieApp
//
//  Created by Anshul Shah on 12/11/18.
//  Copyright © 2018 Anshul Shah. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self) 
    }
    
    func convertToDate() -> Date {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
           return dateFormatter.date(from: self) ?? Date()
       }
    // Tested against ["ab_dsfdsac_dsd_f", nil, "_", "__abc_a", "Ac_C", "abc", "abc_", "_abc", "", "Abc_def_De", "ABc_def_De", "ABC_def_De", "bc_def_De", "ADay", "aDay", "a_Day", "A_Day"]
    
    /// Underscore string to lowerCamelCase.
    var underscoreToCamelCase: String {
        
        let underscore = CharacterSet(charactersIn: "_")
        var items: [String] = self.components(separatedBy: underscore)
        
        var start: String = items.first ?? ""
        let first = String(start.prefix(1)).lowercased()
        let other = String(start.dropFirst())
        start =  first + other
        
        items.remove(at: 0)
        
        let camelCased: String =  items.reduce(start) { (result, i) -> String in
            result + i.capitalized
        }
        
        return camelCased
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
}

extension String {
    
    func lineSpaced(_ spacing: CGFloat,alignment: NSTextAlignment) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.alignment = alignment
        let attributedString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return attributedString
    }
    
    func lineSpaceWithFont(_ spacing: CGFloat, font:UIFont, fontColour: UIColor, alignment: NSTextAlignment) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.alignment = alignment
        let attributedString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                                             NSAttributedString.Key.font: font,
                                                                             NSAttributedString.Key.foregroundColor: fontColour
            ])
        return attributedString
    }
    
}


extension String {
    
    var localized : String {
        return NSLocalizedString(self, comment: "")
    }
}

extension String {
        
    var validateBookingName :Bool {
        let words =  self.split { !$0.isLetter }
        return words.count >= 4
    }
    var validateName :Bool {
        let words =  self.split { !$0.isLetter }
        return words.count >= 2
    }
    
    var validateTxt :Bool {
        return self.count >= 3
    }
    
    var validateEmail :Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var validateUserName :Bool {
        return self.count >= 3
    }
    
    var validateMobile :Bool {
        return isPhoneNumber
    }
    
    
    
    
}

extension String {
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}
extension String {

    var isValidPassport: Bool {
        let PASSPORT_REG_EX = "^(?!^0+$)[a-zA-Z0-9]{3,20}$"
        let passport = NSPredicate(format:"SELF MATCHES %@", PASSPORT_REG_EX)

        if (self.count >= 6) {
            return passport.evaluate(with: self)
        } else {
            return false
        }
    }
    
    var validateKuwaitCivilID: Bool {
          
          func digitWeight(string: String, offset: Int, weight: Int = 1) -> Int {
              let fromIndex = string.index(string.startIndex, offsetBy: offset)
              let toIndex = string.index(fromIndex, offsetBy: 1)
              let digit = string[fromIndex..<toIndex]
              if let value = Int(digit) {
                  return value * weight
              }
              
              return 0
          }
          
              var valid = false
              let regex = "[0-9]{12}"
          
          let formatTest = NSPredicate(format: "SELF MATCHES %@", regex)
          if formatTest.evaluate(with: self) {
              
              let sum =
              digitWeight(string: self, offset: 0, weight: 2) +
              digitWeight(string: self, offset: 1, weight: 1) +
              digitWeight(string: self, offset: 2, weight: 6) +
              digitWeight(string: self, offset: 3, weight: 3) +
              digitWeight(string: self, offset: 4, weight: 7) +
              digitWeight(string: self, offset: 5, weight: 9) +
              digitWeight(string: self, offset: 6, weight: 10) +
              digitWeight(string: self, offset: 7, weight: 5) +
              digitWeight(string: self, offset: 8, weight: 8) +
              digitWeight(string: self, offset: 9, weight: 4) +
              digitWeight(string: self, offset: 10, weight: 2)
              
              let validityTest = 11 - sum % 11
              let checksum = digitWeight(string: self, offset: 11)
              if validityTest == checksum {
                  valid = true
              }
              
          }
          
          return valid
      }
}
extension String {
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else { return nil }
        return html
    }
}

extension String {
    
    var validatePass :Bool {
        return self.count > 5
    }
}

extension String
{
    func encodeUrl() -> String
    {
        return self.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
}


