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
        self.view.backgroundColor = UIColor.greenColor()
        
        // set the title of NavigationController
        self.title = "mixhummy"
        
        // define buttons
        myLeftButton = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "onClickMyButton:")

        // put the button items
        self.navigationItem.leftBarButtonItem = myLeftButton
    }
    
    /*
    Button Event
    */
    internal func onClickMyButton(sender: UIButton){
        
        let second = ViewController()
        self.navigationController?.pushViewController(second, animated: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

