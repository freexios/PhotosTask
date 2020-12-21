//
//  Dependency.swift
//  MoviePhotosTask
//
//  Created by Emad Habib on 20/12/2020.
//



import Foundation
import UIKit
import CoreData

protocol HasWindow {
    var window: UIWindow { get }
}

protocol HasAPI {
    var api: API { get }
}

//protocol HasCoreData {
//    var managedObjectContext: NSManagedObjectContext {get}
//}

class AppDependency: HasWindow, HasAPI {
    
    let window: UIWindow
    let api: API
//    let managedObjectContext: NSManagedObjectContext
    
    init(window: UIWindow) {
        self.window = window
        self.api = API.shared
//        self.managedObjectContext = managedContext
    }
    
}
