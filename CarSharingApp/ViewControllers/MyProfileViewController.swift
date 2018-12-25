import UIKit
import JGProgressHUD

class MyProfileViewController:UIViewController{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Мој профил"
       // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Одјави се", style: .done, target: self, action: #selector(handleSignOutButtonPressed))
       fetchCurrentUser()
    }
    @IBAction func odjaviSe(_ sender: Any) {
        Spark.logout { (result, err) in
            if let err = err{
                SparkService.showAlert(style: .alert, title: "Sign Out Error", message: "Failed to sign out with error: \(err.localizedDescription)")
                return
            }
            if result{
                self.performSegue(withIdentifier: "odjaviSe", sender: nil)
            }
            else{
                SparkService.showAlert(style: .alert, title: "Sign Out Error", message: "Failed to sign out")
            }
        }
    }
    
    let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .light)
        hud.interactionType = .blockAllTouches
        return hud
    }()
    func fetchCurrentUser(){
       hud.textLabel.text = "Fetching user..."
       hud.show(in: view)
        Spark.fetchCurrentSparkUser { (message, err, sparkUser) in
            if let err = err {
                SparkService.dismissHud(self.hud, text: "Error", detailText: "\(message)", delay: 3)
                return
            }
            guard let sparkUser = sparkUser else{
                SparkService.dismissHud(self.hud, text: "Error", detailText: "Failed to fetch user", delay: 3  )
                return
            }
            
            Spark.fetchProfileImage(sparkUser: sparkUser, completion: { (message, err, image) in
                if let err = err {
                    SparkService.dismissHud(self.hud, text: "Error", detailText: "\(message)", delay: 3)
                    return
                }
                guard let image = image else{
                    SparkService.dismissHud(self.hud, text: "Error", detailText: "Failed to fetch user", delay: 3  )
                    return
                }
                DispatchQueue.main.async {
                    self.ProfileImage.image = image
                    self.nameLabel.text = sparkUser.name
                    self.emailLabel.text = sparkUser.email
                }
               SparkService.dismissHud(self.hud, text:"" , detailText:"" , delay:0)
            })
        }
    }
}
