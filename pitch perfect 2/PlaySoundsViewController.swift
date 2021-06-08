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
    var audioPlayerNode: AVAudioPlayerNode!

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
    
    
    func play(url:URL, rate: Float, pitch: Float, echo: Float, reverb: Float) {
        // Initialize variables
         let audioEngine = AVAudioEngine()
          audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attach(audioPlayerNode)

          // Setting the pitch
          let pitchEffect = AVAudioUnitTimePitch()
          pitchEffect.pitch = pitch
        audioEngine.attach(pitchEffect)

          // Setting the platback-rate
          let playbackRateEffect = AVAudioUnitVarispeed()
          playbackRateEffect.rate = rate
        audioEngine.attach(playbackRateEffect)

          // Setting the reverb effect
          let reverbEffect = AVAudioUnitReverb()
        reverbEffect.loadFactoryPreset(AVAudioUnitReverbPreset.cathedral)
          reverbEffect.wetDryMix = reverb
        audioEngine.attach(reverbEffect)

          // Setting the echo effect on a specific interval
          let echoEffect = AVAudioUnitDelay()
        audioEngine.attach(echoEffect)
        
         do {
            soundPlayer = try AVAudioPlayer(contentsOf: url as URL)
            soundPlayer.prepareToPlay()
            soundPlayer.volume = 2.0
           
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
        
                play(url: recordedSoundURL, rate: 0.5, pitch: 2, echo: 0, reverb: 0)

            }
            print("slow")
            
               
           case .fast:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
            
                play(url: recordedSoundURL, rate: 1.5, pitch: 0, echo: 0, reverb: 0)
               

            }
            print("fast")
               
           case .high:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
                play(url: recordedSoundURL, rate: 2, pitch: 1000, echo: 0, reverb: 0)
               

            }
            print("high")
               
           case .low:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
                play(url: recordedSoundURL, rate: 2, pitch: -1000, echo: 0, reverb: 0)
               

            }
            print("low")
               
           case .echo:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
                play(url: recordedSoundURL, rate: 0, pitch: 0, echo: 2, reverb: 0)
               

            }
            print("echo")
               
           case .reverb:
            if let recordedSoundURL = recordedSoundURL{
                print("sound uRL", recordedSoundURL)
                play(url: recordedSoundURL, rate: 0, pitch: 0, echo: 0, reverb: 2)
               

            }
            print("reverb")
               
           }
        
    }

    

}
