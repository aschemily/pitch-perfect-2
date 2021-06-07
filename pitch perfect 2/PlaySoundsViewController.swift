//
//  PlaySoundsViewController.swift
//  pitch perfect 2
//
//  Created by Emily Asch on 5/29/21.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    var recordedSoundURL: URL!
    var soundPlayer: AVAudioPlayer!

    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    
//    var audioFile:AVAudioFile!
//    var audioEngine:AVAudioEngine!
//    var audioPlayerNode: AVAudioPlayerNode!
//    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, high, low, echo, reverb
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadRadio(radioURL: (radioStation?.streamURL)!)

        // Do any additional setup after loading the view.
        
    }
    
    
    func play(url:URL) {
         do {
            soundPlayer = try AVAudioPlayer(contentsOf: url as URL)
            soundPlayer.prepareToPlay()
            soundPlayer.volume = 2.0
            soundPlayer.rate = 4.5
            soundPlayer.play()
         } catch let error as NSError {
             print(error.localizedDescription)
         } catch {
             print("AVAudioPlayer init failed")
         }
         
     }
    
    
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        switch(ButtonType(rawValue: sender.tag)!) {
           case .slow:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
            
                //soundPlayer.rate = 0.2
                play(url: recordedSoundURL)
                
               
               

            }
            print("slow")
            
               
           case .fast:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
             play(url: recordedSoundURL)
               

            }
            print("fast")
               
           case .high:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
             play(url: recordedSoundURL)
               

            }
            print("high")
               
           case .low:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
             play(url: recordedSoundURL)
               

            }
            print("low")
               
           case .echo:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
             play(url: recordedSoundURL)
               

            }
            print("echo")
               
           case .reverb:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
             play(url: recordedSoundURL)
               

            }
            print("reverb")
               
           }
        
    }

//    @IBAction func stopButtonPressed(_ sender: AnyObject) {
//        print("Stop Audio Button Pressed")
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
