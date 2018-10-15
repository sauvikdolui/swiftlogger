//
//  ViewController.swift
//  SwiftLogger
//
//  Created by Sauvik Dolui on 13/05/17.
//  Copyright © 2017 Sauvik Dolui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        SampleClass.output()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class SampleClass {
    class func output() {
        Log.d("This is a DEBUG message called in Sample class which is defined in ViewController.swift file", inClass: self)
    }
}
