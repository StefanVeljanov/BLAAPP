import UIKit
import JGProgressHUD
import FirebaseAuth

class StartUpViewController: UIViewController {
    
    var handler: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hud.textLabel.text = "Loading ..."
        hud.show(in: view)
        DispatchQueue.main.async {
            if Auth.auth().currentUser == nil{
                //if user is not logged in pop up Login with fb controller
//                let controller = LogInViewController()
//                self.present(controller, animated: true, completion: nil)
                self.performSegue(withIdentifier: "logInScreen", sender: self)
                return
            }
//            let controller = RootTabViewController()
//            self.present(controller, animated: true, completion: nil)
            self.performSegue(withIdentifier: "rootController", sender: self)
            
//            let secondViewController = self.storyboard.instantiateViewControllerWithIdentifier("SecondViewController") as SecondViewController
//            self.navigationController.pushViewController(secondViewController, animated: true)
        }
    }
    let hud:JGProgressHUD = {
        let hud = JGProgressHUD(style: .light)
        hud.interactionType = .blockAllTouches
        return hud
    }()
}
