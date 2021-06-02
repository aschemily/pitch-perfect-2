//
//  RecordViewController.swift
//  pitch perfect 2
//
//  Created by Emily Asch on 5/25/21.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
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
    
//    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
//        
//        if flag{
//            playButton.isEnabled = true
//            performSegue(withIdentifier: "nextButton", sender: soundRecorder.url)
//        }else{
//            print("recording not successful")
//        }
//    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            recordButton.isEnabled = true
            playButton.setTitle("PLAY", for: .normal)
            recordButton.isEnabled = false
        
        //print("audio finished playing")
        
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
    
    
    @IBAction func sendSound(_ sender: Any) {
        print("hitting next to send sound")
        soundRecorder.delegate = self
        performSegue(withIdentifier: "sendSound", sender: soundRecorder.url)
        
        print("in send sound", soundRecorder.delegate = self)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if flag{
            playButton.isEnabled = true
            print("audio finished recording")
        }else{
            print("recording not successful")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendSound"{
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedSoundURL = sender as! URL
            playSoundsVC.recordedSoundURL = recordedSoundURL
            print("sending sound", recordedSoundURL)
        }
    }
    
    

}

