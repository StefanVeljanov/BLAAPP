
import UIKit
import FirebaseAuth

class RootTabViewController: UITabBarController {
    
    var handler: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//
//        handler = Auth.auth().addStateDidChangeListener({ (auth, user) in
//            self.checkLoggedInUserStatus()
//        })
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        guard let handler = handler else {
//            return
//        }
//        Auth.auth().removeStateDidChangeListener(handler)
//    }
//    fileprivate func checkLoggedInUserStatus(){
//        DispatchQueue.main.async {
//            if Auth.auth().currentUser == nil{
//                //if user is not logged in pop up Login with fb controller
//                let controller = LogInViewController()
//                self.present(controller, animated: true, completion: nil)
//                return
//            }
//        }
}
