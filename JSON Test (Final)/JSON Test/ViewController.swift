//
//  ViewController.swift
//  JSON Test
//
//  Created by Student on 10/13/18.
//  Copyright © 2018 Max Smith. All rights reserved.
//

import UIKit
import Foundation

// Add in propoerties, make API return mirror this
// Step one, construct model object
struct WebsiteDescription: Decodable{
    let name: String
    let description: String
    // Struct object that is itself a struct is as follows...
    let courses: [Course]
}

// If some values are not guaranteed, make optional with "?"
struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        // Change to guard else return without "!" after url parameter below in function
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // perhaps check err
            // perhps check response status 200 OK
            
            guard let data = data else {return}
            
            do{
//                let websiteDescription = try
//                    JSONDecoder().decode(WebsiteDescription.self, from: data)
//                print(websiteDescription.name,
//                      websiteDescription.description)
                
                let courses = try
                    JSONDecoder().decode([Course].self, from: data)
                print(courses)
            }
            catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
//            Printing single data point
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            
            }.resume()


}

}
