//
//  SceneDelegate.swift
//  Fashions
//
//  Created by Abdallah on 4/2/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = initVC()
        self.window = window
        window.makeKeyAndVisible()
        
    }
    
    func initVC() -> UINavigationController {
        if let userLoggedIn = UserDefaults.standard.object(forKey: UserDefaultsKeys.isUserLoggedIn) as? Bool {
            if userLoggedIn{
                return homeVC()
            } else {
                return loginVC()
            }
        }
        return onboardingVC()
    }
    
    func loginVC() -> UINavigationController {
        let loginVC = mainStoryboard.instantiateViewController(withIdentifier: Views.loginVC) as! LoginVC
        let navigationController = UINavigationController.init(rootViewController: loginVC)
        //        self.window?.rootViewController = navigationController
        return navigationController
    }
    
    func homeVC() -> UINavigationController {
        let homeVC = mainStoryboard.instantiateViewController(withIdentifier: Views.homeVC) as! HomeVC
        let navigationController = UINavigationController.init(rootViewController: homeVC)
        //        self.window?.rootViewController = navigationController
        return navigationController
    }
    func onboardingVC() -> UINavigationController {
        let onboardingVC = mainStoryboard.instantiateViewController(withIdentifier: Views.onboardingVC) as! OnboardingVC
        let navigationController = UINavigationController.init(rootViewController: onboardingVC)
        //        self.window?.rootViewController = navigationController
        return navigationController
    }
        
        func sceneDidDisconnect(_ scene: UIScene) {
            // Called as the scene is being released by the system.
            // This occurs shortly after the scene enters the background, or when its session is discarded.
            // Release any resources associated with this scene that can be re-created the next time the scene connects.
            // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        }
        
        func sceneDidBecomeActive(_ scene: UIScene) {
            // Called when the scene has moved from an inactive state to an active state.
            // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        }
        
        func sceneWillResignActive(_ scene: UIScene) {
            // Called when the scene will move from an active state to an inactive state.
            // This may occur due to temporary interruptions (ex. an incoming phone call).
        }
        
        func sceneWillEnterForeground(_ scene: UIScene) {
            // Called as the scene transitions from the background to the foreground.
            // Use this method to undo the changes made on entering the background.
        }
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            // Called as the scene transitions from the foreground to the background.
            // Use this method to save data, release shared resources, and store enough scene-specific state information
            // to restore the scene back to its current state.
        }
}

