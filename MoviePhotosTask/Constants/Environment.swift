//
//  Environment.swift
//  MovieApp
//
//  Created by Anshul Shah on 12/11/18.


import Foundation

enum Server {
    case developement
    case testing
    case production
}

class Environment {
    
//    Add Target conditions here and set defualt server here based on Target.
//    #if BASEPROJECT_PRODUCTION
//        static let server:Server    =   .production
//    #elseif BASEPROJECT_STAGING
//        static let server:Server    =   .staging
//    #else
//        static let server:Server    =   .developement
//    #endif
    
    static let server:Server =  .production
    
    // To print the log set true.
    static let imageBaseUrl = "https://www.flickr.com"
    static let debug:Bool  =  true
    
    class func APIBasePath() -> String {
        switch self.server {
            case .production:
               return "https://www.flickr.com/"
            
            case .testing:
               return "https://www.flickr.com/"
            
            case .developement:
                return "https://www.flickr.com/"
        }
    }
    
    /// WP
    class func firbaseTopic() -> String {
        switch self.server {
        case .developement:
            return "IOS_TESTING"
        case .testing:
            return "IOS_TESTING"
        case .production:
            return "IOS"
        }
    }
    
    class func API_TOKEN()-> String {
        return ""
    }
    
    /// API ~ TOKEN
    class func MOVIEDB_APIKEY() -> String {
        switch self.server {
        case .developement:
            return ""
        case .testing:
            return ""
        case .production:
            return ""
        }
    }
    
}


