//
//  APIRouter.swift
//  MovieApp
//
//  Created by Anshul Shah on 12/11/18.
//  Copyright © 2018 Anshul Shah. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter:URLRequestConvertible {
    
   
    case getPhotos(method:String = "flickr.photos.search",format:String = "json" , nojsoncallback:Int = 50,text:String,page:Int,per_page:Int,api_key:String = "d17378e37e555ebef55ab86c4180e8dc")
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case  .getPhotos:
                return .get
                
            default:break
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case.getPhotos:
                return nil
            }
        }()
        
        let url: URL = {
            // Add base url for the request
            let baseURL:String = {
                return Environment.APIBasePath()
            }()
            // build up and return the URL for each endpoint
            let relativePath: String? = {
                switch self {
                case.getPhotos(let method,let format,let nojsoncallback,let text,let page,let per_page,let api_key):
                    return "services/rest?method=\(method)&format=\(format)&nojsoncallback=\(nojsoncallback)&text=\(text)&page=\(page)&per_page=\(per_page)&api_key=\(api_key)"
                }
            }()

            let url = URL(string: (baseURL + (relativePath ?? "")).encodeUrl())!
            return url
        }()
        
        let encoding:ParameterEncoding = {
            return JSONEncoding.default
        }()
                
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
//        urlRequest.allHTTPHeaderFields = headers
        return try encoding.encode(urlRequest, with: params)
    }
}


extension String
{
    func encodeUrl() -> String
    {
        return self.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
}

