//
//  TableView+Extensions.swift
//  ASCIOS
//
//  Created by islam on 2/23/20.
//  Copyright © 2020 islam. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func showLoadingFooter(){
        let loadingFooter = UIActivityIndicatorView(style: .gray)
        loadingFooter.frame.size.height = 60
        loadingFooter.hidesWhenStopped = true
        loadingFooter.startAnimating()
        tableFooterView = loadingFooter
    }
    
    func hideLoadingFooter(){
//        let tableContentSufficentlyTall = (contentSize.height > frame.size.height)
//        let atBottomOfTable = (contentOffset.y >= contentSize.height - frame.size.height)
//        if atBottomOfTable && tableContentSufficentlyTall {
//            UIView.animate(withDuration: 0.2, animations: {
//                self.contentOffset.y = self.contentOffset.y - 60
//            }, completion: { finished in
//                self.tableFooterView = UIView()
//            })
//        } else {
//            self.tableFooterView = UIView()
//        }
        self.tableFooterView = UIView()

    }
    
    func isLoadingFooterShowing() -> Bool {
        return tableFooterView is UIActivityIndicatorView
    }
    
}


extension UITableViewCell {
    func animated(){
        self.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.3, animations: {
            self.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
            },completion: { finished in
                UIView.animate(withDuration: 0.1, animations: {
                    self.layer.transform = CATransform3DMakeScale(1,1,1)
                })
        })
    }
}
