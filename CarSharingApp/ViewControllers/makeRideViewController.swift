//
//  makeRideViewController.swift
//  CarSharingApp
//
//  Created by Stefan Veljanov on 12/24/18.
//  Copyright © 2018 Bojan Dimitrijevski. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker
import CoreLocation



class makeRideViewController: UIViewController,CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var StartingPlaceAdressLabel: UILabel!
    @IBOutlet weak var StartingPlaceNameAdressLabel: UILabel!
    @IBOutlet weak var EndingPlaceAdressLabel: UILabel!
    @IBOutlet weak var EndingPlaceNameLabel: UILabel!
    @IBOutlet weak var timeTextField: UITextField!
    private var datePicker:UIDatePicker?
    var placesClient: GMSPlacesClient!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        let loc = Locale(identifier: "mk")
        self.datePicker?.locale = loc
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(makeRideViewController.dateChanged(datePicker:)), for: .valueChanged)
        timeTextField.inputView = datePicker
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(makeRideViewController.dismissPicker))
        timeTextField.inputAccessoryView = toolBar
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(makeRideViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        
        placesClient = GMSPlacesClient.shared()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MakeRide2" {
            if let nextViewController = segue.destination as? makeRide2ViewController {
                if let start = StartingPlaceNameAdressLabel.text {
                nextViewController.startingPoint = start
                }
                if let end = EndingPlaceNameLabel.text {
                 nextViewController.endingPoint = end
                }
                if let time = timeTextField.text {
                    nextViewController.time = time
                }
               
            }
        }
    }
    
    
    
    @IBAction func pickPlace(_ sender: UIButton) {
        let center = CLLocationCoordinate2D(latitude: 37.788204, longitude: -122.411937)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001, longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001, longitude: center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)
        
        placePicker.pickPlace(callback: {(place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                self.StartingPlaceNameAdressLabel.text = place.name
                self.StartingPlaceAdressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                    .joined(separator: "\n")
            } else {
                self.StartingPlaceNameAdressLabel.text = "No place selected"
                self.StartingPlaceAdressLabel.text = ""
            }
        })
    }
    
    @IBAction func pickEndingPoint(_ sender: Any) {
        let center = CLLocationCoordinate2D(latitude: 37.788204, longitude: -122.411937)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001, longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001, longitude: center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)
        
        placePicker.pickPlace(callback: {(place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                self.EndingPlaceNameLabel.text = place.name
                self.EndingPlaceAdressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                    .joined(separator: "\n")
            } else {
                self.EndingPlaceNameLabel.text = "No place selected"
                self.EndingPlaceAdressLabel.text = ""
            }
        })
    }
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    @objc func viewTapped(gestureRecognizer:UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @objc func dateChanged(datePicker:UIDatePicker) {
        let formater = DateFormatter()
        formater.locale = Locale(identifier: "mk_MK")
        formater.dateFormat = "dd/MM/yyyy  HH:mm"
        timeTextField.text = formater.string(from: datePicker.date)
        //        view.endEditing(true)
        
    }
    
    
}
extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}
