//
//  ImagePreviewVC.swift
//  MoviePhotosTask
//
//  Created by Emad Habib on 20/12/2020.
//

import UIKit

class ImagePreviewVC: BaseViewController {
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var noPhotoLbl:UILabel!

    var image:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        DispatchQueue.main.async {
            if let url = self.image {
                self.imageView.kf.setImage(with: url)
            }else {
                self.noPhotoLbl.isHidden = false
            }
        }
    }
    
    
    
    @IBAction func backHandler(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
