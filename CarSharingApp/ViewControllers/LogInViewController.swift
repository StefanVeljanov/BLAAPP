import UIKit
import FirebaseAuth
import FirebaseCore
import FacebookCore
import FacebookLogin
import FirebaseDatabase
import JGProgressHUD
import FirebaseStorage


class LogInViewController: UIViewController {

    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var segueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fbButton.layer.cornerRadius = 10
        navigationController?.navigationBar.isHidden = true
        
    }
    
    @IBAction func fbButtonPressed(_ sender: Any) {
        hud.textLabel.text = "Signing in with Facebook ..."
        hud.show(in: view)
        
        Spark.signInWithFacebook(in: self) { (message, error, sparkUser) in
            if let err = error {
                SparkService.dismissHud(self.hud, text: "Error", detailText: "\(message) \(err.localizedDescription)", delay: 2)
                return
            }
            guard let sparkUser = sparkUser else{
                SparkService.dismissHud(self.hud, text: "Error", detailText: "Failed to fetch user", delay: 2)
                return
            }
            print("Successfully signed in with Facebook with: \(sparkUser)")
            //SparkService.dismissHud(self.hud, text: "Success", detailText: "Successfully signed in with Facebook", delay: 3)
            SparkService.dismissHud(self.hud, text:"" , detailText:"" , delay:0)
            let when = DispatchTime.now()
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.performSegue(withIdentifier: "mySegue", sender: nil)
                
                
            })
        }
    }
    let hud:JGProgressHUD = {
        let hud = JGProgressHUD(style: .light)
        hud.interactionType = .blockAllTouches
        return hud
    }()
}
