//
//  DetailViewController.swift
//  mixhummy
//
//  Created by shota_todoroki on 4/26/16.
//  Copyright © 2016 shota_todoroki. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    private var myLeftButton: UIBarButtonItem!
//    private var myRightButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set Cyan to the background color
        self.view.backgroundColor = UIColor.whiteColor()
        
        // set the title of NavigationController
        self.title = "mixhummy"
        
        // define buttons
        myLeftButton = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "onClickLeftButton:")

        // put the button items
        self.navigationItem.leftBarButtonItem = myLeftButton
        
        let photo: UIButton = UIButton(frame: CGRectMake(0,0,300,200))
        photo.backgroundColor = UIColor.orangeColor();
        photo.layer.masksToBounds = true
        photo.setTitle("Photo", forState: .Normal)
        photo.layer.cornerRadius = 20.0
        photo.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height/3)
        self.view.addSubview(photo);
        
        let description: UIButton = UIButton(frame: CGRectMake(0,0,300,200))
        description.backgroundColor = UIColor.rgb(r: 51, g: 153, b: 102, alpha: 1.0)
        description.layer.masksToBounds = true
        description.setTitle("description", forState: .Normal)
        description.layer.cornerRadius = 20.0
        description.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height/3*2+20)
        self.view.addSubview(description);
        
        let clickButton: UIButton = UIButton(frame: CGRectMake(0,0,80,40))
        clickButton.backgroundColor = UIColor.rgb(r: 51, g: 153, b: 255, alpha: 1.0)
        clickButton.layer.masksToBounds = true
        clickButton.setTitle("click", forState: .Normal)
        clickButton.layer.cornerRadius = 20.0
        clickButton.layer.position = CGPoint(x: self.view.bounds.width-50 , y:self.view.bounds.height-30)
        clickButton.addTarget(self, action: "onClickButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(clickButton);
    }
    
    /*
    Button Event
    */
    internal func onClickLeftButton(sender: UIButton){
        
        let second = MainViewController()
        self.navigationController?.pushViewController(second, animated: true)

    }
    internal func onClickButton(sender: UIButton){
        
        if self.view.backgroundColor == UIColor.whiteColor(){
            self.view.backgroundColor = UIColor.rgb(r: 204, g: 255, b: 255, alpha: 1.0)
        } else {
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

