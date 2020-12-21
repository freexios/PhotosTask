////
////  TabBarController.swift
////  ASCIOS
////
////  Created by Emad Habib on 2/13/20.
////  Copyright © 2020 islam. All rights reserved.
////
//
//import Foundation
//import UIKit
//
////enum HomeBarKind: Int {
////    case smartista
////    case calender
////    case store
////    case map
////    
////    var title: String? {
////        switch self {
////        case .smartista:
////            return L.ECHO.smart.Locaz
////        case .calender:
////            return L.ECHO.calendar.Locaz
////        case .store:
////            return L.ECHO.store.Locaz
////        case .map:
////            return L.ECHO.map.Locaz
////        }
////    }
////    
////    var icon: UIImage? {
////        switch self {
////        case .smartista:
////            return UIImage(imageLiteralResourceName: "smartista_selected")
////        case .calender:
////            return UIImage(imageLiteralResourceName: "date_selected")
////        case .store:
////            return UIImage(imageLiteralResourceName: "store_selected")
////        case .map:
////            return UIImage(imageLiteralResourceName: "map_selected")
////        }
////    }
////    
////    var icon_selected: UIImage? {
////        switch self {
////        case .smartista:
////            return UIImage(imageLiteralResourceName: "smartista_unselected")
////        case .calender:
////            return UIImage(imageLiteralResourceName: "date_unselected")
////        case .store:
////            return UIImage(imageLiteralResourceName: "store_unselected")
////        case .map:
////            return UIImage(imageLiteralResourceName: "map_unselected")
////        }
////    }
////    
////    
////    var navigationController: UINavigationController {
////        let navigation = UINavigationController()
////        navigation.tabBarItem.title = self.title
////        navigation.tabBarItem.image = self.icon
////        navigation.tabBarItem.selectedImage = self.icon_selected
////        return navigation
////    }
////}
//
//
//extension RawRepresentable where RawValue == Int {
//    
//    static var itemCount: Int {
//        var index = 0
//        while Self(rawValue: index) != nil {
//            index += 1
//        }
//        
//        return index
//    }
//    
//    static var items: [Self] {
//        var items = [Self]()
//        var index = 0
//        while let item = Self(rawValue: index) {
//            items.append(item)
//            index += 1
//        }
//        
//        return items
//    }
//}
