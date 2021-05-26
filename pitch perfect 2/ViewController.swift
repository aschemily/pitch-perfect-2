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
    @IBOutlet weak var playButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stopButton.isEnabled = false
        print("starting over")
    }
    
    @IBAction func recordingOn(_ sender: Any) {
        recordButton.isEnabled = false
        stopButton.isEnabled = true
        playButton.isEnabled = false
        print("button was pressed")
    }
    
    @IBAction func recordingStopped(_ sender: Any) {
        recordButton.isEnabled = true
        stopButton.isEnabled = false
        playButton.isEnabled = true
        print("button was stopped")
    }
    
    @IBAction func playSound(_ sender: Any) {
        recordButton.isEnabled = false
        stopButton.isEnabled = true
    }
    
    
    


}

