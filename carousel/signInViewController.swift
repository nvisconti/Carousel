//
//  signInViewController.swift
//  carousel
//
//  Created by Nathan Visconti on 9/25/15.
//  Copyright © 2015 Nathan Visconti. All rights reserved.
//

import UIKit

class signInViewController: UIViewController {
    @IBAction func onBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signForgot: UIView!
    @IBOutlet weak var emailPass: UIView!
    @IBOutlet weak var createText: UIImageView!

 
    var initialY1: CGFloat!
    var initialY2: CGFloat!
    let offset: CGFloat = -250
    let offset2: CGFloat = -90
    
func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

    
    @IBAction func onSignIn(sender: AnyObject) {

        
            
        if self.email.text!.isEmpty || self.password.text!.isEmpty {
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
        
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
        
            self.presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        
        }
        
    
        else {
        
            let alertController = UIAlertController(title: "Signing in...", message: nil, preferredStyle: .Alert)
            
            
            self.presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }

            
          
        delay(2) {
            
            
        alertController.dismissViewControllerAnimated(true, completion: nil)

        
        if self.email.text! != "email" && self.password.text! != "password" {
            
            let alertController = UIAlertController(title: "Sign in Failed", message: "Incorrect email or password", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            
            self.presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        }
        
        else {
            
            self.performSegueWithIdentifier("loginSegue", sender: self)
            
        }
            }
    }
    
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        
    self.signForgot.frame.origin = CGPoint(x: self.signForgot.frame.origin.x, y: self.initialY1 + self.offset)
        
    self.emailPass.frame.origin = CGPoint(x: self.emailPass.frame.origin.x, y: self.initialY2 + self.offset2)
        
    self.createText.alpha = 0
        

    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        self.signForgot.frame.origin = CGPoint(x: self.signForgot.frame.origin.x, y: self.initialY1)
        
         self.emailPass.frame.origin = CGPoint(x: self.emailPass.frame.origin.x, y: self.initialY2)
        
        self.createText.alpha = 1
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialY1 = signForgot.frame.origin.y
        initialY2 = emailPass.frame.origin.y

        
//        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        

        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTap(sender: AnyObject) {
        email.endEditing(true)
        password.endEditing(true)
     }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
