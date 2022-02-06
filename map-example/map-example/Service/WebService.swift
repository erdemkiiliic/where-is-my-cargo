//
//  WebService.swift
//  map-example
//
//  Created by Kilic, erdem(AWF) on 6.02.2022.
//

import Foundation

class WebService {
    
    let url: URL
    
    init()
    {
        self.url = URL(string: "https://raw.githubusercontent.com/erdemkiiliic/web-service-response-sample/main/map-example.json")!
    }
   
    func fetchCargoInfo(completion: @escaping([(Cargo)]?) -> ()){
        URLSession.shared.dataTask(with: self.url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                let cargoInfo = try? JSONDecoder().decode([Cargo].self, from: data)
                if let cargoInfo = cargoInfo{
                    completion(cargoInfo)
                }
            }
        }.resume()
    }
}
