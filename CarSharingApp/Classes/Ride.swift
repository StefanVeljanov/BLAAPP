import UIKit

class Ride{
    var users : [User] = []
    let from:String
    let to:String
    let time:String
    var freeSpaces:String
    let car:Car?
    let pet:Bool
    let cigarette:Bool
    let radio:Bool
    let price:String
    
    init(user: User,from:String,to:String,time:String,freeSpaces:String,car:Car,pet:Bool,cigarette:Bool,radio:Bool,price:String) {
        users.append(user)
        self.from=from
        self.to=to
        self.time=time
        self.freeSpaces=freeSpaces
        self.car=car
        self.pet=pet
        self.cigarette=cigarette
        self.radio=radio
        self.price=price
    }
}
