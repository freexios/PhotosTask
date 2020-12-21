//
//  PhotoModel.swift
//  MoviePhotosTask
//
//  Created by Emad Habib on 20/12/2020.
//

import Foundation

struct PhotosModelResponse : Codable {

    var photos : Photo?
    var stat : String?


    enum CodingKeys: String, CodingKey {
        case photos
        case stat = "stat"
    }
    
    init(response: [String: Any]?) {
        guard let response = response else {
            return
        }
        if let data = try? JSONSerialization.data(withJSONObject: response, options: []) {
            let dataResponse = try? JSONDecoder().decode(PhotosModelResponse.self, from: data)
            self.photos = dataResponse?.photos
            self.stat = dataResponse?.stat
        }
    }
    
}


import Foundation

struct Photo : Codable {
    
    let farm : Int?
    let id : String?
    let isfamily : Int?
    let isfriend : Int?
    let ispublic : Int?
    let owner : String?
    let secret : String?
    let server : String?
    let title : String?
    let page : Int?
    let pages : Int?
    let perpage : Int?
    let photo : [Photo]?
    let total : String?

    
    enum CodingKeys: String, CodingKey {
        case farm = "farm"
        case id = "id"
        case isfamily = "isfamily"
        case isfriend = "isfriend"
        case ispublic = "ispublic"
        case owner = "owner"
        case secret = "secret"
        case server = "server"
        case title = "title"
        case page = "page"
        case pages = "pages"
        case perpage = "perpage"
        case photo = "photo"
        case total = "total"
    }

}
