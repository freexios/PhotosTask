//
//  PhotoTCell.swift
//  MoviePhotosTask
//
//  Created by Emad Habib on 20/12/2020.
//

import UIKit

class PhotoTCell: UITableViewCell {
    
    @IBOutlet weak var photoImgV:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(photo:Photo) {
        let url = buildImageUrl(photo: photo)
        DispatchQueue.main.async {
            self.photoImgV.kf.setImage(with: url)
        }
    }
    
    private func buildImageUrl(photo:Photo) ->URL? {
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
