## More about Cidaas

To know more about Cidaas visit [CIDaaS](https://www.cidaas.com)

## Cidaas Documentation 

https://docs.cidaas.de/

## Requirements

    Operating System    :   iOS 9.0 or above
    Xcode               :   8
    Swift               :   3.0

## Installation

Cidaas-Facebook is available through [CocoaPods](https://cocoapods.org/pods/Cidaas-Facebook). To install
it, simply add the following line to your Podfile:

```swift
pod 'Cidaas-Facebook'
```

## Creating Facebook App

The following steps are to be followed to create a Facebook App
1. Once Gradle sync is completed, Go to the [Facebook Developers Console](https://developers.facebook.com/), add a new App then give it a valid name and click "Create App Id"
2. Take note of the App ID
3. On the left side, you have the navigation drawer. Click Settings and then Basic
4. Click Add Platform and Choose iOS
5. Enter your project's bundle id
6. Turn on "Single Sign On" and click "Save changes"

## Getting Started 

The following steps are to be followed to use this <b>Cidaas-Facebook</b>

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
    <string>your app id</string>
    <key>FacebookDisplayName</key>
    <string>your app name</string>
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>fbapi</string>
        <string>fb-messenger-api</string>
        <string>fbauth2</string>
        <string>fbshareextension</string>
    </array>
```

2. In your project's AppDelegate file, import the `Cidaas_Facebook` module

```swift
    import Cidaas_Facebook
```

3. Inside the AppDelegate's `application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)` method, redirect the parameters to the `CidaasFacebook` class method `didFinishLaunchingOptions()`

```swift
    CidaasFacebook.didFinishLaunchingOptions(application, didFinishLaunchingWithOptions: launchOptions)
```

4. Inside the AppDelegate's `application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:])` method, redirect the parameters to the `CidaasFacebook` class method `openUrlConfig()` and has to be returned 

```swift
    return CidaasFacebook.openUrlConfig(app, open: url, options: options)
```

5. Inside the AppDelegate's `applicationDidBecomeActive(_ application: UIApplication)` method, redirect the paramters to the `CidaasFacebook` class method `cidaasBecomeActive()`

```swift
    CidaasFacebook.cidaasBecomeActive(application)
```

6. In your project's ViewController file, import the `Cidaas_Facebook` module

```swift
    import Cidaas_Facebook
```

7. Assign the delegate of CidaasFacebook by setting the current ViewController

```swift
    CidaasFacebook.delegate = self
```

8. Call the `login()` method and receive the access token as callback

```swift 
    CidaasFacebook.cidaasFacebookLogin { response in
        if response.success == true {
            print ("Access Token : " + response.access_token);
        }
        else {
            print ("Login Error");
        }
    }
```

## Sample Code

AppDelegate.swift

```swift
    import UIKit
    import Cidaas_Facebook

    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {
        var window: UIWindow?
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:     [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
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

ViewController.swift

```swift
    import UIKit
    import Cidaas_Facebook
    
    class ViewController: UIViewController {
    @IBOutlet var btn_facebook: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()   
    }

    @IBAction func btnAction(_ sender: Any) {
        CidaasFacebook.delegate = self
        CidaasFacebook.cidaasFacebookLogin { loginResponse in
            if loginResponse.success == true {
                CidaasSDK.getUserInfo(accessToken: loginResponse.accessToken!) { token_response in
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
}


```

## Screen Shots

<p align="center">

<img src = "https://user-images.githubusercontent.com/26590601/27226814-5cbfda96-52be-11e7-98ae-996a97d87539.PNG" alt="Screen 1" style="width:40%" height="600">

<img src = "https://user-images.githubusercontent.com/26590601/27728490-d92e4086-5d9f-11e7-9fe5-f6f81677c333.png" alt="Screen 2" style="width:40%" height="600">

</p>

## Help and Support

For more support visit [CIDaaS Support](http://support.cidaas.com/en/support/home)
