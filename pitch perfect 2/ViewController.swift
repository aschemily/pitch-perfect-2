//
//  ViewController.swift
//  pitch perfect 2
//
//  Created by Emily Asch on 5/25/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var soundRecorder: AVAudioRecorder!
    var soundPlayer: AVAudioPlayer!
    
    var fileName: String = "audioFile.m4a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupRecorder()
        playButton.isEnabled = false
    }
    
    
    func getDocumentDirector() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    func setupRecorder(){
        let audioFilename = getDocumentDirector().appendingPathComponent(fileName)
        let recordSetting = [AVFormatIDKey : kAudioFormatAppleLossless, AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue, AVEncoderBitRateKey : 320000, AVNumberOfChannelsKey : 2, AVSampleRateKey : 44100.2] as [String: Any]
        
        do{
            soundRecorder = try AVAudioRecorder(url: audioFilename, settings: recordSetting)
            soundRecorder.delegate = self
            soundRecorder.prepareToRecord()
        } catch{
            print(error)
        }
    }
    
    func setupPlayer(){
        let audioFilename = getDocumentDirector().appendingPathComponent(fileName)
        
        do{
            soundPlayer = try AVAudioPlayer(contentsOf: audioFilename)
            soundPlayer.delegate = self
            soundPlayer.prepareToPlay()
            soundPlayer.volume = 1.0
            
        }catch{
            print(error)
        }
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        playButton.isEnabled = true
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordButton.isEnabled = false
        playButton.setTitle("PLAY", for: .normal)
    }
    
    
    @IBAction func recordingOn(_ sender: Any) {
        
        if recordButton.titleLabel?.text == "RECORD"{
            soundRecorder.record()
            recordButton.setTitle("STOP", for: .normal)
            playButton.isEnabled = false
        }else{
            soundRecorder.stop()
            recordButton.setTitle("RECORD", for: .normal)
            playButton.isEnabled = false
            
        }
       
        
    }
    
    
    @IBAction func playSound(_ sender: Any) {
        if playButton.titleLabel?.text == "PLAY"{
            playButton.setTitle("PLAYING...", for: .normal)
            recordButton.isEnabled = false
            setupPlayer()
            soundPlayer.play()
        }else{
            soundPlayer.stop()
            playButton.setTitle("PLAY", for: .normal)
            recordButton.isEnabled = false
        }
    
    }
    
    
    


}

