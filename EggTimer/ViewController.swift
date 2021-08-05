//
//  ViewController.swift
//  EggTimer
//
//  Created by 大江祥太郎 on 2021/08/05.
//

import UIKit

class ViewController: UIViewController {

//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    let eggTimes = ["Sooft":300,"Medium":420,"Hard":720]
    
    
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle! //soft,medium,hard
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if  secondsPassed < totalTime {
            
            secondsPassed += 1
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = percentageProgress
            
            
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
}

