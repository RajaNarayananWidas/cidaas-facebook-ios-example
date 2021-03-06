//
//  CustomLoader.swift
//  CidaasAuthenticator
//
//  Created by Ganesh Kumar on 16/11/17.
//  Copyright © 2017 Cidaas. All rights reserved.
//

import Foundation

public class CustomLoader : NSObject {
    
    // local shared instance
    public static var sharedCustomLoaderInstance = CustomLoader()
    
    
    // show loader
    public func showLoader(_ view:UIView, using hud:MBProgressHUD?, message:String = "Loading, Please wait", callback : @escaping (MBProgressHUD?) ->())  {
        DispatchQueue.main.async {
            let spinnerActivity : MBProgressHUD?
            if hud != nil {
                spinnerActivity = hud
            }
            else {
                spinnerActivity = MBProgressHUD.showAdded(to: view, animated: true)
            }
            spinnerActivity?.bezelView.backgroundColor = UIColor.black
            spinnerActivity?.contentColor = UIColor.white
            spinnerActivity?.label.text = message
            spinnerActivity?.backgroundView.color = UIColor.gray
            spinnerActivity?.backgroundView.alpha = 0.25
            callback(spinnerActivity)
        }
    }
    
    // hide loader
    public func hideLoader(_ view:UIView){
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: view, animated: true)
        }
    }
}
