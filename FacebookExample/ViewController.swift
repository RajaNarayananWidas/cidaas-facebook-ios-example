//
//  ViewController.swift
//  FacebookExample
//
//  Created by ganesh on 29/06/17.
//  Copyright © 2017 Widas. All rights reserved.
//

import UIKit
import Cidaas_Facebook
import Cidaas_SDK

class ViewController: UIViewController, LoaderDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        CidaasFacebook.delegate = self
        CidaasSDK.loaderDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btn_cidaas_facebook_login(_ sender: Any) {
        CidaasFacebook.cidaasFacebookLogin { cidaas_token_response in
            if cidaas_token_response.issuccess == true {
                CidaasSDK.getUserInfo(accessToken: (cidaas_token_response.accessTokenEntity?.accessToken)!) { cidaas_user_info_response in
                    let alert = UIAlertController(title: "Display Name", message: cidaas_user_info_response.displayName, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else {
                let alert = UIAlertController(title: "Error", message: cidaas_token_response.errorMessage, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func showLoader() {
        CustomLoader.sharedCustomLoaderInstance.showLoader(self.view, using: nil) { (hud) in
            
        }
    }
    
    func hideLoader() {
        CustomLoader.sharedCustomLoaderInstance.hideLoader(self.view)
    }
}

