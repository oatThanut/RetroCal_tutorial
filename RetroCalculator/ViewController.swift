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
    
    @IBOutlet weak var outputLable: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var runningNumber = ""
    var currentOperation = Operation.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
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
        
        runningNumber += "\(sender.tag)"
        outputLable.text = runningNumber
    }
    
    @IBAction func onDiviedPressed(sender: Any){
        processOperation(operation: .Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: Any){
        processOperation(operation: .Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: Any){
        processOperation(operation: .Subtract)
    }
    
    @IBAction func onAddPressed(sender: Any){
        processOperation(operation: .Add)
    }
    
    @IBAction func onEquialPressed(_ sender: Any) {
        processOperation(operation: currentOperation)
    }
    
    func playSound() {
        if btnSound.isPlaying{
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
    func processOperation(operation: Operation) {
        playSound()
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLable.text = result
            }
            currentOperation = operation
        } else {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

}

