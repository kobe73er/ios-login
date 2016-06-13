//
//  ViewController.swift
//  AllTest
//
//  Created by kobe73er on 16/6/13.
//  Copyright © 2016年 kobe73er. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var failedLogInCount = 0
    var waitingSeconds = 60

    @IBOutlet weak var passwordTv: UITextField!
    @IBOutlet weak var usernameTv: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    
    var timer:NSTimer!
    
    
    @IBOutlet weak var alertTextView: UITextView!
    
    @IBAction func LogInBtnPressed(sender: UIButton) {
        if(passwordTv.text=="dengpf" && usernameTv.text=="dengpf"){
            alertTextView.text = "welcome!"
            jumpIntoAnotherView()
        }else{
            alertTextView.text = "wrong password!"
            failedLogInCount++;
            if(failedLogInCount>=3){
                alertTextView.text = "too many failed times wait 1 minutes!"
                logInBtn.enabled = false
                usernameTv.enabled = false
                passwordTv.enabled = false
                
                timer = NSTimer.scheduledTimerWithTimeInterval(1,
                    target:self,selector:Selector("tickDown"),
                    userInfo:nil,repeats:true)
                
            }
        }
        
    }
    func jumpIntoAnotherView(){
        NSLog("jump Into another view")
        let LogInVController = self.storyboard?.instantiateViewControllerWithIdentifier("tableViewCell")
        self.presentViewController(LogInVController!, animated: true, completion: nil)
        
    }
    func tickDown(){
        while(waitingSeconds>0){
            print(waitingSeconds)
            waitingSeconds--;
            print("isMainThread:" ,NSThread.isMainThread());
            NSThread.sleepForTimeInterval(1)
        }
        waitingSeconds = 5
        failedLogInCount = 0
        timer.invalidate()
        alertTextView.text = "you can enter again now!"

        usernameTv.enabled = true
        passwordTv.enabled = true
        logInBtn.enabled = true


    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

