//
//  ViewController.swift
//  RetroCalculator
//
//  Created by oatThanut on 3/5/2560 BE.
//  Copyright © 2560 oatThanut. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var btnSound: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPress(sender: UIButton){
        playSound()
    }
    
    func playSound() {
        if btnSound.isPlaying{
            btnSound.stop()
        }
        
        btnSound.play()
    }

}

