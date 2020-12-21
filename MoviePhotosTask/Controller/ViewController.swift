//
//  ViewController.swift
//  MoviePhotosTask
//
//  Created by Emad Habib on 20/12/2020.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var tableView:UITableView!
    private let photoSingleViewCell = "PhotoTCell"
    var viewModel = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getPhotosDataAPI(page: 1, per_page: 20)
    }
    
    override func setupUI() {
        
        tableView.register(UINib(nibName: photoSingleViewCell, bundle: nil), forCellReuseIdentifier: photoSingleViewCell)
        tableView.rowHeight = 300
        tableView.estimatedRowHeight = UITableView.automaticDimension
        viewModel.data.asObservable()
            .bind(to: tableView.rx.items) { (table, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = table.dequeueReusableCell(withIdentifier: self.photoSingleViewCell, for: indexPath) as! PhotoTCell
                if row % 6 == 0 {
                    cell.photoImgV.image = UIImage(named: "ad_banner")
                }else {
                    cell.configureCell(photo: element)
                }
                return cell
            }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Photo.self).bind(to: viewModel.selectedItem).disposed(by: disposeBag)
        
        viewModel.isLoading
            .distinctUntilChanged()
            .drive(onNext: { [weak self] (isLoading) in
                guard let `self` = self else { return }
                // Hide Indicator
                self.killLoading()
                if isLoading {
                    // Show Indicator
                    self.loading()
                }
            })
            .disposed(by: disposeBag)
        
        tableView.rx.didEndDecelerating.subscribe(onNext: {[weak self] _ in
            //
            if self?.tableView.contentOffset.y == 0 {
            }
            else {
                let  check = (((self?.tableView.contentOffset.y)! + (self?.tableView.frame.size.height)!) >= (self?.tableView.contentSize.height)!)
                if check {
                    if self?.viewModel.nextPage != nil {
                        //   self?.tableView.showLoadingFooter()
                        self?.viewModel.nextPage! += 1
                        self?.viewModel.callNextPage.onNext(Void())
                    }
                }
                else {
                    return
                }
            }
        }, onCompleted: { [weak self]  in
            //self?.tableView.hideLoadingFooter()
        }).disposed(by: disposeBag)
        
        //MARK: - Select item should be handle in viewModel with (coordintor) or (root and sub navigation contollers)
        viewModel.selectedItem.asObservable().subscribe { [weak self] photo in
            guard let self = self , let _p = photo.element  else {return}
            
            if let mainPhoto = _p {
                if let url = self.viewModel.buildImageUrl(photo: mainPhoto) {
                    let vc = ImagePreviewVC()
                    vc.image = url
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }.disposed(by: disposeBag)
        
    }
}
