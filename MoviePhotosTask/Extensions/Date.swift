//
//  Date.swift
//  ASCIOS
//
//  Created by Emad Habib on 5/12/20.
//  Copyright © 2020 islam. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    static func getFormattedDate(string: String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd - MMM -yyyy"
        
        let date: Date? = dateFormatterGet.date(from: string)
        if let date = date {
            print("Date",dateFormatterPrint.string(from: date)) // Feb 01,2018
            return dateFormatterPrint.string(from: date);
        }else {
            return ""
        }
    }
    
    static func getDateFromTimp(stamp:Int) ->String {
        let epocTime = TimeInterval(stamp)
        let myDate = Date(timeIntervalSince1970: epocTime)
        let form = DateFormatter()
        form.dateFormat = "dd/MM/yyy"
        return form.string(from: myDate)
    }
}
