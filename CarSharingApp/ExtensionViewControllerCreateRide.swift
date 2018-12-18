//
//  ExtensionViewControllerCreateRide.swift
//  CarSharingApp
//
//  Created by Stefan Veljanov on 12/1/18.
//  Copyright © 2018 Bojan Dimitrijevski. All rights reserved.
//

import UIKit
import GooglePlaces


extension ViewControllerCreateRide: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        <#code#>
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        <#code#>
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
