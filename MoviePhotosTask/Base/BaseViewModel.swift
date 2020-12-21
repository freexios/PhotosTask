//
//  BaseViewModel.swift
//  ASCIOS
//
//  Created by islam on 2/19/20.
//  Copyright © 2020 islam. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel {
    
    // Dispose Bag
    let disposeBag = DisposeBag()
    let alertDialog = PublishSubject<(String,String)>()
//    let sideMenuObserv = PublishSubject<Bool>()
    let dependency:Dependencies

    init() {
        dependency = AppDependency(window: Application.window!)
    }
}
