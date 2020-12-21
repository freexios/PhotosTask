////
////  Analytiecs.swift
////  ASCIOS
////
////  Created by islam on 3/1/20.
////  Copyright © 2020 islam. All rights reserved.
////
//
//import Foundation
//
////import FirebaseAnalytics
//
//struct Analytic {
//    enum Event: String {
//        case DETAILS
//        case SEARCH
//        case SEARCH_RESULT
//        case HOME
//        case PAYMENT_CONFIRMATION
//        case MENU
//        case BOOK
//        case FAVORITE
//        case ABOUT
//        case CONTACT_US
//        case PRIVACY
//        case TERMS_AND_CONDITIONS
//        case NOTIFICATIONS
//        case TRAVEL_AGENCY_PROFILE
//    }
//    enum Param: String {
//        case screen
//    }
//    
//static func log(_ key: Event, params: [Param: Any] = [:]) {
//        var parameters: [String: Any] = [:]
//
//        for (k, value) in params {
//            parameters[k.rawValue] = value
//        }
//
//        Analytics.logEvent(key.rawValue, parameters: parameters)
//    }
//}
//
//
//// Analytic.log(.openScreen, params: [.screen: Analytic.Screen.HOME.rawValue])
