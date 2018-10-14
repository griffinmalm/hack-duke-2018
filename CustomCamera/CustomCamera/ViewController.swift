//
//  ViewController.swift
//  CustomCamera
//
//  Created by Student on 10/13/18.
//  Copyright © 2018 Max Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func cameraButton_TouchUpInside(_ sender: UIButton) {
        performSegue(withIdentifier: "showPhoto_Segue", sender: nil)
    }
    
}

