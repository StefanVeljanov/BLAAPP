import UIKit

class User {
    var name:String?
    var surname:String?
    var age:String?
    var email:String?
    var vozac:Bool = false
    var profilePic:UIImage
    var mobileNum:String
    var ridesOffered = 0
    var rating = 0.0
    
    init(name:String,surname:String,age:String,email:String,profilePic:UIImage,mobileNum:String,ridesOffered:Int,rating:Double) {
        self.name=name
        self.surname=surname
        self.age=age
        self.email=email
        self.profilePic=UIImage()
        self.mobileNum=mobileNum
        self.ridesOffered=ridesOffered
        self.rating=rating
    }
}
