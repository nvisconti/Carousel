//
//  settingsViewController.swift
//  carousel
//
//  Created by Nathan Visconti on 9/25/15.
//  Copyright © 2015 Nathan Visconti. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {

    @IBOutlet weak var settingsViewControllers: UIScrollView!
    
    @IBAction func onXButton(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsViewControllers.contentSize = CGSize(width: 320, height: 695)
        


        // Do any additional setup after loading the view.
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
