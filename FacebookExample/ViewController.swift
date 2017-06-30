//
//  ViewController.swift
//  FacebookExample
//
//  Created by ganesh on 29/06/17.
//  Copyright © 2017 Widas. All rights reserved.
//

import UIKit
import Cidaas_Facebook
import CidaasSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CidaasFacebook.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn_cidaas_facebook_login(_ sender: Any) {
        CidaasFacebook.cidaasFacebookLogin { cidaas_token_response in
            if cidaas_token_response.success == true {
                CidaasSDK.getUserInfo(accessToken: cidaas_token_response.accessToken!) { cidaas_user_info_response in
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
}

