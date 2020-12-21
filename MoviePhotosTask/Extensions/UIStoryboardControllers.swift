//
//  UIStoryboard+Controllers.swift
//  MovieApp
//
//  Created by Anshul Shah on 12/11/18.
//  Copyright © 2018 Anshul Shah. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    static var AuthScreens: UIStoryboard {
        return UIStoryboard(name: "Auth", bundle: nil)
    }
    
    static var Messages: UIStoryboard {
        return UIStoryboard(name: "Messages", bundle: nil)
    }
    
    static var Account:UIStoryboard {
        return UIStoryboard(name: "Account", bundle: nil)
    }
    
    static var AlertScreens:UIStoryboard {
        return UIStoryboard(name: "AlertScreens", bundle: nil)
    }
}


extension UIStoryboard {
    
    var tabBarVC: TabBarController {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? TabBarController else {
            fatalError(String(describing: TabBarController.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    //loginVC
    
    var loginVC: LoginViewController {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as? LoginViewController else {
            fatalError(String(describing: LoginViewController.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    
//    ChangeLangPopUpVC
    
    var changeLangPopUpVC: ChangeLangPopUpVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: ChangeLangPopUpVC.self)) as? ChangeLangPopUpVC else {
            fatalError(String(describing: ChangeLangPopUpVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var newPasswordVC : NewPasswordViewController {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: NewPasswordViewController.self)) as? NewPasswordViewController else {
            fatalError(String(describing: LoginViewController.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
        
    }
    
    var signUpVC:SignUpViewController {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: SignUpViewController.self)) as? SignUpViewController else {
            fatalError(String(describing: SignUpViewController.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
        
    }
    var jobProfileVC :JobProfileVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: JobProfileVC.self)) as? JobProfileVC else {
            fatalError(String(describing: JobProfileVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
        
    }
    var codeVC: CodeViewController {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: CodeViewController.self)) as? CodeViewController else {
            fatalError(String(describing: CodeViewController.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
        
    }
    var sendMessageVC : SendMessageVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: SendMessageVC.self)) as? SendMessageVC else {
            fatalError(String(describing: SendMessageVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
        
    }
    var contactForgetVC:ForgetContactViewController {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: ForgetContactViewController.self)) as? ForgetContactViewController else {
            fatalError(String(describing: ForgetContactViewController.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
        
    }
    var phoneNumberVC : PhoneVerificationViewController {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: PhoneVerificationViewController.self)) as? PhoneVerificationViewController else {
            fatalError(String(describing: PhoneVerificationViewController.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
        
    }
    var categoriesVC: CategoriesVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: CategoriesVC.self)) as? CategoriesVC else {
            fatalError(String(describing: CategoriesVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
        
    }
    var forgetPasswordVC : ForgetPasswordViewController {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: ForgetPasswordViewController.self)) as? ForgetPasswordViewController else {
            fatalError(String(describing: ForgetPasswordViewController.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
        
    }
    var generalErrorAlertViewController : GeneralErrorAlertViewController {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: GeneralErrorAlertViewController.self)) as? GeneralErrorAlertViewController else {
            fatalError(String(describing: GeneralErrorAlertViewController.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
        
    }
    var compeleteDataVC : ComAccountDataViewController {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: ComAccountDataViewController.self)) as? ComAccountDataViewController else {
            fatalError(String(describing: ComAccountDataViewController.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    var designersVC : DesignersVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: DesignersVC.self)) as? DesignersVC else {
            fatalError(String(describing: DesignersVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var chatVC : StaticChatVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: StaticChatVC.self)) as? StaticChatVC else {
            fatalError(String(describing: StaticChatVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var aboutUsVC: AboutUsVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: AboutUsVC.self)) as? AboutUsVC else {
            fatalError(String(describing: AboutUsVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var addNewMessageVC: AddNewMessageVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: AddNewMessageVC.self)) as? AddNewMessageVC else {
            fatalError(String(describing: AddNewMessageVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var changePasswordVC: ChangePasswordVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: ChangePasswordVC.self)) as? ChangePasswordVC else {
            fatalError(String(describing: ChangePasswordVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var contactUsVC: ContactUsVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: ContactUsVC.self)) as? ContactUsVC else {
            fatalError(String(describing: ContactUsVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var favsVC: FavsVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: FavsVC.self)) as? FavsVC else {
            fatalError(String(describing: FavsVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var manageMessagesActionSheetVC: ManageMessagesActionSheetVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: ManageMessagesActionSheetVC.self)) as? ManageMessagesActionSheetVC else {
            fatalError(String(describing: ManageMessagesActionSheetVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var manageMessagesVC: ManageMessagesVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: ManageMessagesVC.self)) as? ManageMessagesVC else {
            fatalError(String(describing: ManageMessagesVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var myProfileVC: MyProfileVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: MyProfileVC.self)) as? MyProfileVC else {
            fatalError(String(describing: MyProfileVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var personalBalanceVC: PersonalBalanceVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: PersonalBalanceVC.self)) as? PersonalBalanceVC else {
            fatalError(String(describing: PersonalBalanceVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var settingsVC: SettingsVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: SettingsVC.self)) as? SettingsVC else {
            fatalError(String(describing: SettingsVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var updateProfileVC: UpdateProfileVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: UpdateProfileVC.self)) as? UpdateProfileVC else {
            fatalError(String(describing: UpdateProfileVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var usagePolicyVC: UsagePolicyVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: UsagePolicyVC.self)) as? UsagePolicyVC else {
            fatalError(String(describing: UsagePolicyVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
}
