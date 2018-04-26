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
        // Usage
        Logger.printDebugInfo(event: .debug) // DEBUG log without message
        Logger.printDebugInfo(message: "This is an ERROR message", event: .error) // ERROR log with message
        Logger.printDebugInfo(message: "This is a INFO message", event: .info,withdateFormat: DateFormat.format_EEEE) // INFO with dateformat
        Logger.printDebugInfo(message: "This is a VERBOSE message", event:.verbose,printData:[1,2,3,["hello":"I am captain america"]]) // VERBOSE log with data to print
        Logger.printDebugInfo(message: "This is a WARNING message", event: .warning) // WARNING log
        Logger.printDebugInfo(message: "This is a SEVERE message", event: .severe) // SEVERE Error log

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

