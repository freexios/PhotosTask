//
//  AppDefault.swift
//  ASCIOS
//
//  Created by Emad Habib on 3/19/20.
//  Copyright © 2020 islam. All rights reserved.

import Foundation
import RxSwift


extension AppDelegate {
    
    func showAuthorizedError()->Bool{
        guard let LoggedIn = UserDefaults.standard.object(forKey: "showAuthorizedError") as? Bool else {
            return false
        }
        return LoggedIn
    }
    
    func setAuthorizedError(isAuthorized:Bool) {
        UserDefaults.standard.set(isAuthorized, forKey: "showAuthorizedError")
    }
    
    func isLoggedIn()->Bool{
        guard let LoggedIn = UserDefaults.standard.object(forKey: "LoggedIn") as? Bool else {
            return false
        }
        return LoggedIn
    }
    
    
    func isLoggedInWithSkip()->Bool{
        guard let LoggedIn = UserDefaults.standard.object(forKey: "LoggedInWithSkip") as? Bool else {
            return false
        }
        return LoggedIn
    }
    func setAuth(isLogged:Bool) {
        UserDefaults.standard.set(isLogged, forKey: "LoggedIn")
    }
    
    func setSkipMode(isLogged:Bool) {
        UserDefaults.standard.set(isLogged, forKey: "LoggedInWithSkip")
    }
    func getFCMToken()->String{
        guard let FCMToken = UserDefaults.standard.string(forKey: "FCMToken")else {
            return ""
        }
        return FCMToken
    }
    
    func setFCMToken(FCMToken:String) {
        UserDefaults.standard.set(FCMToken, forKey: "FCMToken")
    }
    
    func setSearchText(SearchText:String) {
        guard var searchHistory = getSearchText() else{
            UserDefaults.standard.set([SearchText], forKey: "SearchHistory")
            return
        }
        if  searchHistory.contains(SearchText) {return}
        else{
            if searchHistory.count == 5 {return}
            searchHistory.append(SearchText)
            UserDefaults.standard.set(searchHistory, forKey: "SearchHistory")
        }
    }
    
    func getSearchText() -> [String]?{
        guard let searchTexts = UserDefaults.standard.object(forKey: "SearchHistory") as? [String] else {
            return nil
        }
        return searchTexts
    }
    
    func getRememberMe()->Bool{
        guard let rememmber = UserDefaults.standard.object(forKey: "RememberMe") as? Bool else {
            return false
        }
        return rememmber
    }
    
    func setRememberMe(rememmber:Bool) {
        UserDefaults.standard.set(rememmber, forKey: "RememberMe")
    }
    
    func setToken(token:String){
        UserDefaults.standard.set(token, forKey: "token")
    }
    
    func getToken()->String{
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else {
            return ""
        }
        return token
    }
    
    func setInstallDate(token:String){
        UserDefaults.standard.set(token, forKey: "InstallDate")
    }
    
    func getInstallDate()->String{
        guard let installDate = UserDefaults.standard.object(forKey: "InstallDate") as? String else {
            return ""
        }
        return installDate
    }
    
    func setUserData(user:UserModel?){
        guard let user = user else {return}
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: "userData")
            UserDefaults.standard.synchronize()
        }
    }
    
    func getUserData()-> UserModel?{
        if let data = UserDefaults.standard.data(forKey: "userData") {
            if let decoded = try? JSONDecoder().decode(UserModel.self, from: data) {
                return decoded
            }else{
                return nil
            }
        }else {
            return nil
        }
    }
}
