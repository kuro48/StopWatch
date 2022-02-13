//
//  ViewController.swift
//  StopWatch
//
//  Created by 黒川龍之介 on 2022/02/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var evlabel: UILabel!
    var count: Float = 0.00
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        evlabel.isHidden = true
    }
    
    @objc func up() {
        count = count + 0.01
        label.text = String(format: "%.2f",count)
    }
    
    @objc func hantei() {
        if count <= 10.20 || count >= 9.80 {
            evlabel.text = "PERFECT"
        }else if count <= 10.30 || count >= 9.70{
            evlabel.text = "GREAT"
        }else if count <= 10.50 || count >= 9.50{
            evlabel.text = "GOOD"
        }else{
            evlabel.text = "BAD"
        }
        if evlabel.isHidden == true {
            evlabel.isHidden = false
        }
    }
    
    @IBAction func start() {
        
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    @IBAction func stop() {
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        
        count = 0.00
        label.text = String(format: "%.2f",count)
    }

}

