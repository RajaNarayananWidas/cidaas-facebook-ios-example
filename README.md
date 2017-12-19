## More about Cidaas

To know more about Cidaas visit [CIDaaS](https://www.cidaas.com)

## Cidaas Documentation 

https://docs.cidaas.de/

## Requirements

    Operating System    :   iOS 10.0 or above
    Xcode               :   9
    Swift               :   4.0

## Installation

**Cidaas-Facebook** is available through [CocoaPods](https://cocoapods.org/pods/Cidaas-Facebook). To install it, simply add the following line to your Podfile:

```swift
pod 'Cidaas-Facebook', '9.4.1'
```

## Creating Facebook App

The following steps are to be followed to create a **Facebook App**

1. Go to the [Facebook Developers Console](https://developers.facebook.com/), add a new App then give it a valid name and click **Create App Id**

2. Take note of the App ID

3. On the left side, you have the navigation drawer. Click **Settings** and then Basic

4. Click **Add Platform** and Choose iOS

5. Enter your project's bundle id

6. Turn on **Single Sign On** and click **Save changes**

## Getting Started 

The following steps are to be followed to use this **Cidaas-Facebook**

1. Copy and paste the following code in your Info.plist file

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>fbyour_app_id</string>
        </array>
    </dict>
</array>

<key>FacebookAppID</key>
<string>your fb app id</string>

<key>FacebookDisplayName</key>
<string>your fb app name</string>

<key>LSApplicationQueriesSchemes</key>
<array>
    <string>fbapi</string>
    <string>fb-messenger-api</string>
    <string>fbauth2</string>
    <string>fbshareextension</string>
</array>
```

2. In your project's **AppDelegate.swift** file, import the **Cidaas_Facebook** module

```swift
import Cidaas_Facebook
```

3. Inside the AppDelegate's **application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)** method, redirect the parameters to the **CidaasFacebook** class method **didFinishLaunchingOptions()**

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    CidaasFacebook.didFinishLaunchingOptions(application, didFinishLaunchingWithOptions: launchOptions)
    return true
}
```

4. Inside the AppDelegate's **application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:])** method, redirect the parameters to the **CidaasFacebook** class method **openUrlConfig()** and has to be returned 

```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    return CidaasFacebook.openUrlConfig(app, open: url, options: options)
}
```

5. Inside the AppDelegate's **applicationDidBecomeActive(_ application: UIApplication)** method, redirect the paramters to the **CidaasFacebook** class method **cidaasBecomeActive()**

```swift
func applicationDidBecomeActive(_ application: UIApplication) {       
    CidaasFacebook.cidaasBecomeActive(application)
}
```

6. Create a plist file and fill all the inputs in key value pair. The inputs are below mentioned.

The plist file should become like this :

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">

<plist version="1.0">
    <dict>
        <key>  AuthorizationURL  </key>
        <string>  Your authorization url  </string>
            
        <key>  TokenURL  </key>
        <string>  Your token url  </string>
        
        <key>  UserInfoURL  </key>
        <string>  Your user info url  </string>

        <key>SocialUrl</key>
        <string>your social url</string>

        <key>  RedirectURI  </key>
        <string>  Your redirect uri  </string>
    
        <key>  LogoutURL  </key>
        <string>  Your logout url  </string>

        <key>  ClientID  </key>
        <string>  Your client id  </string>

        <key>  ViewType  </key>
        <string>  Your view type  </string>
            
    </dict>
</plist>
```

For more details to find app id and urls <a href = https://github.com/Cidaas/cidaas-sdk-ios#user-content-steps-to-find-app-id-and-urls> Find AppId and AppURLs </a>

7. Mention the file name in **AppDelegate.swift**

```swift
CidaasSDK.plistFilename = "Your file name"
```

8. In your project's **ViewController.swift** file, import the **Cidaas_Facebook** module

```swift
import Cidaas_Facebook
```

9. Assign the delegate of **CidaasFacebook** by setting the current ViewController

```swift
CidaasFacebook.delegate = self
```

10. Call the **cidaasFacebookLogin()** method and receive the cidaas access token information and user information as callback

```swift 
CidaasFacebook.cidaasFacebookLogin { token_response in
    // your code here
}
```

If you are using **Cidaas-SDK** additionally, no need to manually call the **cidaasFacebookLogin** function, just simply initialise the **CidaasFacebook** class and assign the delegate

```swift
var cidaas = CidaasFacebook()
CidaasFacebook.delegate = self
```

## Sample Code

**AppDelegate.swift**

```swift
import UIKit
import Cidaas_Facebook
import Cidaas_SDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        CidaasSDK.plistFilename = "Cidaas"
        CidaasFacebook.didFinishLaunchingOptions(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return CidaasFacebook.openUrlConfig(app, open: url, options: options)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        CidaasFacebook.cidaasBecomeActive(application)
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
```

**ViewController.swift**

```swift
import UIKit
import Cidaas_Facebook
import Cidaas_SDK

class ViewController: UIViewController, LoaderDelegate {

    @IBOutlet var btn_facebook: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        CidaasSDK.loaderDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func btnAction(_ sender: Any) {
        CidaasFacebook.delegate = self
        _ = CidaasFacebook()
        CidaasFacebook.cidaasFacebookLogin { loginResponse in
            if loginResponse.issuccess == true {
                
                CidaasSDK.getUserInfo(accessToken: (loginResponse.accessTokenEntity?.accessToken)!) { token_response in
                    let alert = UIAlertController(title: "Display Name", message: token_response.displayName, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
            else {
                let alert = UIAlertController(title: "Error", message: loginResponse.errorMessage, preferredStyle: UIAlertControllerStyle.alert)
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
```

## Screen Shots

<p align="center">

<img src = "https://user-images.githubusercontent.com/26590601/27226814-5cbfda96-52be-11e7-98ae-996a97d87539.PNG" alt="Screen 1" style="width:40%" height="600">

<img src = "https://user-images.githubusercontent.com/26590601/27728490-d92e4086-5d9f-11e7-9fe5-f6f81677c333.png" alt="Screen 2" style="width:40%" height="600">

</p>

## Help and Support

For more support visit [CIDaaS Support](http://support.cidaas.com/en/support/home)
