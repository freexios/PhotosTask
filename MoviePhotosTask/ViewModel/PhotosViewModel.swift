//
//  PhotosViewModel.swift
//  MoviePhotosTask
//
//  Created by Emad Habib on 20/12/2020.
//


import Foundation
import RxSwift
import RxCocoa

class PhotosViewModel: BaseViewModel {
    let isLoading: ActivityIndicator =  ActivityIndicator()
    //    lazy var callError = PublishSubject<ErrorScreenStatus>()
    lazy var msg = Variable<String>("")
    var data  = Variable<[Photo]>([])
    //Selected Model
    var selectedItem = PublishSubject<Photo?>()
    //Paging Metadata
    var nextPage: Int? = 1
    //Method
    var callNextPage = PublishSubject<Void>()
    
    override init() {
        super.init()
        
        self.callNextPage.asObservable().subscribe(onNext: { [weak self] in
            guard let `self` = self else { return }
            // Check internet availability, call next page API if internet available
            if UtilityFunctions.isConnectedToInternet == true {
                if self.nextPage != nil {
                    if let nextPage = self.nextPage {
                        self.getPhotosDataAPI(page: nextPage, per_page: 20)
                        self.nextPage = nil
                    }
                }
            } else {
                // Fetch photos data from local cache, as internet is not available
                //MARK: - GET Cache Data
                
            }
        }).disposed(by: disposeBag)
        
        
    }
    
    func getPhotosDataAPI(text: String = "The Strange Ones", page: Int, per_page: Int) {
        self.dependency.api.regularRequest(apiRouter: .getPhotos(text: text, page: page, per_page: per_page))
            .trackActivity(isLoading)
            .observeOn(MainScheduler.asyncInstance)
            .subscribe {[weak self] (event) in
                guard let `self` = self else { return }
                switch event {
                case .next(let result):
                    switch result {
                    case .success(value: let response):
                        let model = PhotosModelResponse(response: response)
                        if let status = model.stat , status == "ok" {
                            if let data = model.photos , let photos = data.photo {
                                if photos.count > 0 {
                                    self.data.value.append(contentsOf: photos)
                                }
                                self.nextPage = model.photos?.page ?? 1
                            }
                            else
                            {
                                //self.callError.onNext(.unknownError)
                                self.msg.value = model.stat ?? "unknownError"
                            }
                        }
                        else {
                            self.msg.value = "unknownError"//model.message ?? ""
                            //self.callError.onNext(.unknownError)
                        }
                    case .failure(let error):
                        if error.code == InternetConnectionErrorCode.offline.rawValue {
                            //self.callError.onNext(.noInternet)
                            self.msg.value = error.message ?? ""
                        } else {
                            //self.callError.onNext(.unknownError)
                            self.msg.value = error.message ?? ""
                        }
                    }
                default:
                    break
                }
            }.disposed(by: disposeBag)
    }
    
    
    func buildImageUrl(photo:Photo) ->URL? {
        if let farm = photo.farm , let server = photo.server , let id = photo.id , let secret = photo.secret {
            let auth = "\(id)" + "_" + "\(secret)"
            let urlString = "https://farm66.static.flickr.com/\(server)/\(auth).jpg"
            if let url = URL(string: urlString) {
                return url
            }
        }
        return nil
    }
    
}
