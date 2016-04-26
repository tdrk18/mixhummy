//
//  ViewController.swift
//  mixhummy
//
//  Created by shota_todoroki on 4/22/16.
//  Copyright © 2016 shota_todoroki. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private var myLeftButton: UIBarButtonItem!
    private var myRightButton: UIBarButtonItem!
    
//    private var
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set Cyan to the background color
        self.view.backgroundColor = UIColor.whiteColor()
        
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
        
        let officialButton: UIButton = UIButton(frame: CGRectMake(0,0,300,150))
        officialButton.backgroundColor = UIColor.rgb(r: 204, g: 51, b: 51, alpha: 1.0)
        officialButton.layer.masksToBounds = true
        officialButton.setTitle("Next", forState: .Normal)
        officialButton.layer.cornerRadius = 20.0
        officialButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height/3)
        officialButton.addTarget(self, action: "showDetailButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(officialButton);
        
        let eventButton: UIButton = UIButton(frame: CGRectMake(0,0,140,150))
        eventButton.backgroundColor = UIColor.orangeColor();
        eventButton.layer.masksToBounds = true
        eventButton.setTitle("Next", forState: .Normal)
        eventButton.layer.cornerRadius = 20.0
        eventButton.layer.position = CGPoint(x: self.view.bounds.width/3-25 , y:self.view.bounds.height/2+75)
        eventButton.addTarget(self, action: "showDetailButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(eventButton);
        
        let eventButton2: UIButton = UIButton(frame: CGRectMake(0,0,140,150))
        eventButton2.backgroundColor = UIColor.orangeColor();
        eventButton2.layer.masksToBounds = true
        eventButton2.setTitle("Next", forState: .Normal)
        eventButton2.layer.cornerRadius = 20.0
        eventButton2.layer.position = CGPoint(x: self.view.bounds.width/3*2+25 , y:self.view.bounds.height/2+75)
        eventButton2.addTarget(self, action: "showDetailButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(eventButton2);
    }
    
    /*
    Button Event
    */
    internal func onClickMyButton(sender: UIButton){
        
        switch(sender.tag){
        case 1:
            if self.view.backgroundColor == UIColor.whiteColor(){
                self.view.backgroundColor = UIColor.rgb(r: 204, g: 255, b: 255, alpha: 1.0)
            } else {
                self.view.backgroundColor = UIColor.whiteColor()
            }
            
        case 2:
            let second = CreateViewController()
            self.navigationController?.pushViewController(second, animated: true)
            
        default:
            print("error")
        }
    }
    
    internal func showDetailButton(sender: UIButton){
        let next = DetailViewController()
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

