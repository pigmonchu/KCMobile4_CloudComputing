import UIKit
import Firebase
//import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let IS_IPHONE = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone
    let cloudManager = CloudManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Lanzo el controlador de lista de noticias
        let summaryVC = NewsViewController(dataManager: cloudManager)
        let rootVC = UINavigationController(rootViewController: summaryVC)
        
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }

}

