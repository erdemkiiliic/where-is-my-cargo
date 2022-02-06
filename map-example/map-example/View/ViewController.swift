//
//  ViewController.swift
//  map-example
//
//  Created by Kilic, erdem(AWF) on 6.02.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    private var cargoMapViewModel: CargoMapViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //cargoMapViewModel?.getCargoData()
        getCargoData()
    }
    
    func getCargoData(){
        WebService().fetchCargoInfo { cargoInfo in
            if let cargoInfo = cargoInfo {
                print(cargoInfo)
                //cargoMapViewModel = CargoMapViewModel(cargoInfo: cargoInfo)
            }
        }
    }
    
    
    
    func goCoordinate(){
        //let region = cargoMapViewModel.getCoordinateRegion()
        //mapView.setRegion(region, animated: true)
    }
}

