//
//  Cargo.swift
//  map-example
//
//  Created by Kilic, erdem(AWF) on 6.02.2022.
//

import Foundation

struct Cargo : Decodable{
    
    let title : String?
    let desc : String?
    let latitude: Double
    let longitude: Double
}
