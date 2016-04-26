//
//  SecondViewController.swift
//  mixhummy
//
//  Created by shota_todoroki on 4/22/16.
//  Copyright © 2016 shota_todoroki. All rights reserved.
//

import Foundation
import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    var myTextField: UITextField!
    var myTitleField: UITextField!
    var myDescriptionField: UITextField!
    let sc = UIScrollView()
    var txtActiveField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sc.frame = self.view.frame;
        sc.backgroundColor = UIColor.whiteColor()
        sc.delegate = self
        sc.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(sc)
        
        self.title = "Add Event"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "onClickMyButton:")
        
        // DatePickerを生成する.
        let myDatePicker: UIDatePicker = UIDatePicker()
        
        // datePickerを設定（デフォルトでは位置は画面上部）する.
        myDatePicker.frame = CGRectMake(0, 50, self.view.frame.width, 200)
        myDatePicker.timeZone = NSTimeZone.localTimeZone()
        myDatePicker.datePickerMode = UIDatePickerMode.Date
        myDatePicker.backgroundColor = UIColor.whiteColor()
        myDatePicker.layer.cornerRadius = 5.0
        myDatePicker.layer.borderWidth = 0.5
//        myDatePicker.layer.shadowOpacity = 0.5
        myDatePicker.layer.position = CGPoint(x: sc.bounds.width/2, y: 100)
        
        // 値が変わった際のイベントを登録する.
        myDatePicker.addTarget(self, action: "onDidChangeDate:", forControlEvents: .ValueChanged)
        
        // DataPickerをViewに追加する.
        sc.addSubview(myDatePicker)
        
        
        
        // UITextFieldを作成する.
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        myTextField.text = ""
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
//        myTextField.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 100);
        
        // UITextFieldをViewに追加する.
//        self.view.addSubview(myTextField)
        
        // UITextFieldを作成する.
        myTitleField = UITextField(frame: CGRectMake(0,0,270,30))
        // 表示する文字を代入する.
        myTitleField.text = "title"
        // 枠を表示する.
        myTitleField.borderStyle = UITextBorderStyle.RoundedRect
        // UITextFieldの表示する位置を設定する.
        myTitleField.layer.position = CGPoint(x:self.view.bounds.width/2, y: sc.bounds.height/2 - 50);
        // Viewに追加する.
        myTitleField.delegate = self
        self.view.addSubview(myTitleField)
        
        // UITextFieldを作成する.
        myDescriptionField = UITextField(frame: CGRectMake(0,0,270,150))
        // 表示する文字を代入する.
        myDescriptionField.text = "description of the event"
        // 枠を表示する.
        myDescriptionField.borderStyle = UITextBorderStyle.RoundedRect
        // UITextFieldの表示する位置を設定する.
        myDescriptionField.layer.position = CGPoint(x:self.view.bounds.width/2, y: sc.bounds.height/2 + 50);
        // Viewに追加する.
        myDescriptionField.delegate = self
        self.view.addSubview(myDescriptionField)
        
//        sc.delegate = self
        
        myDescriptionField.delegate = self
        
        sc.addSubview(myTitleField)
        sc.addSubview(myDescriptionField)
    }
    
    /*
    DatePickerが選ばれた際に呼ばれる.
    */
    internal func onDidChangeDate(sender: UIDatePicker){
        
        // フォーマットを生成.
        let myDateFormatter: NSDateFormatter = NSDateFormatter()
        myDateFormatter.dateFormat = "yyyy/MM/dd"
        
        // 日付をフォーマットに則って取得.
        let mySelectedDate: NSString = myDateFormatter.stringFromDate(sender.date)
        myTextField.text = mySelectedDate as String
    }
    
    /*
    Button Event
    */
    internal func onClickMyButton(sender: UIButton){
        print(myTitleField.text!)
        print(myDescriptionField.text!)
        print(myTextField.text!)
    }
    
    /*
    UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("textFieldDidBeginEditing:" + textField.text!)
        txtActiveField = textField
        return true
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "handleKeyboardWillShowNotification:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "handleKeyboardWillHideNotification:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func handleKeyboardWillShowNotification(notification: NSNotification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
        var txtLimit = txtActiveField.frame.origin.y + txtActiveField.frame.height
        let kbdLimit = myBoundSize.height - keyboardScreenEndFrame.size.height
        
        
        print("テキストフィールドの下辺：(\(txtLimit))")
        print("キーボードの上辺：(\(kbdLimit))")
        
        if txtLimit >= kbdLimit {
            sc.contentOffset.y = txtLimit - kbdLimit
        }
    }
    
    func handleKeyboardWillHideNotification(notification: NSNotification) {
        sc.contentOffset.y = -70
    }
}
