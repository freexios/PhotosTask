//
//  UIViewController+Reactive.swift
//  MovieApp
//
//  Created by Anshul Shah on 12/11/18.
//  Copyright © 2018 Anshul Shah. All rights reserved.
//

#if os(iOS)
    
    import UIKit
    
    import RxCocoa
    import RxSwift
    
    public extension Reactive where Base: UIViewController {
        public var viewDidLoad: ControlEvent<Void> {
            let source = self.methodInvoked(#selector(Base.viewDidLoad)).map { _ in }
            return ControlEvent(events: source)
        }

        public var viewWillAppear: ControlEvent<Bool> {
            let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { $0.first as? Bool ?? false }
            return ControlEvent(events: source)
        }
        public var viewDidAppear: ControlEvent<Bool> {
            let source = self.methodInvoked(#selector(Base.viewDidAppear)).map { $0.first as? Bool ?? false }
            return ControlEvent(events: source)
        }

        public var viewWillDisappear: ControlEvent<Bool> {
            let source = self.methodInvoked(#selector(Base.viewWillDisappear)).map { $0.first as? Bool ?? false }
            return ControlEvent(events: source)
        }
        public var viewDidDisappear: ControlEvent<Bool> {
            let source = self.methodInvoked(#selector(Base.viewDidDisappear)).map { $0.first as? Bool ?? false }
            return ControlEvent(events: source)
        }

        public var viewWillLayoutSubviews: ControlEvent<Void> {
            let source = self.methodInvoked(#selector(Base.viewWillLayoutSubviews)).map { _ in }
            return ControlEvent(events: source)
        }
        public var viewDidLayoutSubviews: ControlEvent<Void> {
            let source = self.methodInvoked(#selector(Base.viewDidLayoutSubviews)).map { _ in }
            return ControlEvent(events: source)
        }

        public var willMoveToParentViewController: ControlEvent<UIViewController?> {
            let source = self.methodInvoked(#selector(Base.willMove)).map { $0.first as? UIViewController }
            return ControlEvent(events: source)
        }
        public var didMoveToParentViewController: ControlEvent<UIViewController?> {
            let source = self.methodInvoked(#selector(Base.didMove)).map { $0.first as? UIViewController }
            return ControlEvent(events: source)
        }

        public var didReceiveMemoryWarning: ControlEvent<Void> {
            let source = self.methodInvoked(#selector(Base.didReceiveMemoryWarning)).map { _ in }
            return ControlEvent(events: source)
        }

        /// Rx observable, triggered when the ViewController appearance state changes (true if the View is being displayed, false otherwise)
        public var isVisible: Observable<Bool> {
            let viewDidAppearObservable = self.base.rx.viewDidAppear.map { _ in true }
            let viewWillDisappearObservable = self.base.rx.viewWillDisappear.map { _ in false }
            return Observable<Bool>.merge(viewDidAppearObservable, viewWillDisappearObservable)
        }

        /// Rx observable, triggered when the ViewController is being dismissed
        public var isDismissing: ControlEvent<Bool> {
            let source = self.sentMessage(#selector(Base.dismiss)).map { $0.first as? Bool ?? false }
            return ControlEvent(events: source)
        }

    }
#endif

extension UIViewController {
    func setNavigationBar() {

        self.navigationItem.setHidesBackButton(true, animated:false)

        //your custom view for back image with custom size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))

        if let imgBackArrow = UIImage(named: "back") {
            imageView.image = imgBackArrow
        }
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)

        let backTap = UITapGestureRecognizer(target: self, action: #selector(backToMain))
        view.addGestureRecognizer(backTap)

        let leftBarButtonItem = UIBarButtonItem(customView: view ?? UIView())
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        
    }

    @objc func backToMain() {
        
        if let _ = self.navigationController {
            self.navigationController?.popViewController(animated: true)
        }else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func _backButtonAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func setNavStyle(){
        
        
        
        if #available(iOS 13.0, *), let navigationBar = navigationController?.navigationBar {
          let appearance = UINavigationBarAppearance()
          appearance.configureWithTransparentBackground()
          navigationBar.scrollEdgeAppearance = appearance
          navigationBar.compactAppearance = appearance
          navigationBar.standardAppearance = appearance
            navigationBar.prefersLargeTitles = true
        }
    }

}

