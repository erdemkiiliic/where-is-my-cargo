//
//  CargoViewModel.swift
//  map-example
//
//  Created by Kilic, erdem(AWF) on 6.02.2022.
//

import Foundation
import CoreLocation
import MapKit

struct CargoMapViewModel {
    let cargoInfo : [Cargo]
    
    func getLatitudeAtIndex(index : Int) -> Double {
        return cargoInfo[index].latitude
    }
    
    func getLongitudeAtIndex(index : Int) -> Double {
        return cargoInfo[index].longitude
    }
    
    func getCargoInfoAtIndex(index: Int) -> CargoViewModel{
        let cargoInfoAtIndex = cargoInfo[index]
        return CargoViewModel(cargo: cargoInfoAtIndex)
    }
    
    func getCoordinateRegion() -> MKCoordinateRegion{
        let location = CLLocationCoordinate2D(latitude: cargoInfo[0].latitude, longitude: cargoInfo[0].longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        return region
    }
    
    func getCargoData(){
        WebService().fetchCargoInfo { cargoInfo in
            if let cargoInfo = cargoInfo {
                print(cargoInfo)
                //cargoMapViewModel = CargoMapViewModel(cargoInfo: cargoInfo)
            }
        }
    }
}

struct CargoViewModel {
    let cargo : Cargo
    
    var title : String {
        return self.cargo.title!
    }
    
    var desc : String {
        return self.cargo.desc!
    }
    
    var latitude : Double {
        return self.cargo.latitude
    }
    
    var longitude : Double {
        return self.cargo.longitude
    }
}
