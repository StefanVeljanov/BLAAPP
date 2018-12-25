
import UIKit

class makeRide2ViewController: UIViewController {
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var petSegmentedControl: UISegmentedControl!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var cigarettesSegmentedContol: UISegmentedControl!
    var startingPoint:String?
    var pricePerSeat:String?
    var endingPoint:String?
    var time:String?
    var numbersOfSeats:String?
    var petApproval:Bool = true
    var cigaretteApproval:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        stepperLabel.text = String(sender.value)
    }
    @IBAction func petIndexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            petApproval = true
        case 1:
            petApproval = false
        default:
            break
        }
    }
    @IBAction func cigarettesIndexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
        cigaretteApproval = true
        case 1:
        cigaretteApproval = false
        default:
           break
        }
    }

    @IBAction func createRide(_ sender:UIButton) {
        if let stepper = stepperLabel.text {
            numbersOfSeats = stepper
        }
        if let priceseat = priceTextField.text {
            pricePerSeat = priceseat
        }
        print("Почетната локација е " + startingPoint!)
        print("Крајната локација е " + endingPoint!)
        print("Време на почеток на возењето е " + time!)
        print("Бројот на слободни седишта е " + numbersOfSeats!)
        print("Дали дозволувате миленичиња \(petApproval)")
        print("Дали дозволувате цигари \(cigaretteApproval)")
        print("Цената за возењето од седиште е " + pricePerSeat!)
        
        
    }
  


   
    
}
