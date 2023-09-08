//
//  AppDelegate.swift
//  Fashions
//
//  Created by Abdallah on 4/2/23.
//
import IQKeyboardManagerSwift
import GoogleSignIn
import FirebaseAuth
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK: - Properties.
    var window: UIWindow?
    let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        if let window = self.window {
//            handleRoot(windows: window)
//        }
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        return true
    }

    // MARK: - UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }

}
extension AppDelegate{
    //MARK: - Public Methods.
    public func goToLoginVC() -> UINavigationController {
        let loginVC = mainStoryboard.instantiateViewController(withIdentifier: Views.loginVC) as! LoginVC
        let navigationController = UINavigationController.init(rootViewController: loginVC)
//        self.window?.rootViewController = navigationController
        return navigationController
        
    }
    
    public func goToHomeVC() -> UINavigationController {
        let homeVC = mainStoryboard.instantiateViewController(withIdentifier: Views.homeVC) as! HomeVC
        let navigationController = UINavigationController.init(rootViewController: homeVC)
//        self.window?.rootViewController = navigationController
        return navigationController
    }
    
    private func handleRoot(windows: UIWindow){
        if let userLoggedIn = UserDefaults.standard.object(forKey: UserDefaultsKeys.isUserLoggedIn) as? Bool {
            if userLoggedIn{
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = goToHomeVC()
                self.window?.makeKeyAndVisible()
                
            }else{
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = goToLoginVC()
                self.window?.makeKeyAndVisible()
            }
        }
    }
}


