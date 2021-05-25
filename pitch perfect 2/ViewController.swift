//
//  ViewController.swift
//  pitch perfect 2
//
//  Created by Emily Asch on 5/25/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stopButton.isEnabled = false
        print("starting over")
    }
    
    @IBAction func recordingOn(_ sender: Any) {
        recordButton.isEnabled = false
        stopButton.isEnabled = true
        print("button was pressed")
    }
    
    @IBAction func recordingStopped(_ sender: Any) {
        recordButton.isEnabled = true
        stopButton.isEnabled = false
        print("button was stopped")
    }
    
    


}

