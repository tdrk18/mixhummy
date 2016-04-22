//
//  ViewController.swift
//  mixhummy
//
//  Created by shota_todoroki on 4/22/16.
//  Copyright © 2016 shota_todoroki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var myLeftButton: UIBarButtonItem!
    private var myRightButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set Cyan to the background color
        self.view.backgroundColor = UIColor.cyanColor()
        
        // set the title of NavigationController
        self.title = "mixhummy"
        
        // define buttons
        myLeftButton = UIBarButtonItem(title: "Menu", style: .Plain, target: self, action: "onClickMyButton:")
        myRightButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "onClickMyButton:")
        
        // set tags
        myLeftButton.tag = 1
        myRightButton.tag = 2
        
        // put the button items
        self.navigationItem.leftBarButtonItem = myLeftButton
        self.navigationItem.rightBarButtonItem = myRightButton
    }
    
    /*
    Button Event
    */
    internal func onClickMyButton(sender: UIButton){
        
        switch(sender.tag){
        case 1:
            self.view.backgroundColor = UIColor.blueColor()
            
        case 2:
            self.view.backgroundColor = UIColor.redColor()
            
        default:
            print("error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

