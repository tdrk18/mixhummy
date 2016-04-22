//
//  SecondViewController.swift
//  mixhummy
//
//  Created by shota_todoroki on 4/22/16.
//  Copyright © 2016 shota_todoroki. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    private var myTextField: UITextField!
    private var myTitleField: UITextField!
    private var myDescriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Event"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "onClickMyButton:")
        
        // ただ背景色がシアンなだけ
        self.view.backgroundColor = UIColor.cyanColor()
        
        // DatePickerを生成する.
        let myDatePicker: UIDatePicker = UIDatePicker()
        
        // datePickerを設定（デフォルトでは位置は画面上部）する.
        myDatePicker.frame = CGRectMake(0, 50, self.view.frame.width, 200)
        myDatePicker.timeZone = NSTimeZone.localTimeZone()
        myDatePicker.datePickerMode = UIDatePickerMode.Date
        myDatePicker.backgroundColor = UIColor.whiteColor()
        myDatePicker.layer.cornerRadius = 5.0
//        myDatePicker.layer.shadowOpacity = 0.5
        myDatePicker.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        
        // 値が変わった際のイベントを登録する.
        myDatePicker.addTarget(self, action: "onDidChangeDate:", forControlEvents: .ValueChanged)
        
        // DataPickerをViewに追加する.
        self.view.addSubview(myDatePicker)
        
        // UITextFieldを作成する.
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        myTextField.text = ""
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        myTextField.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 100);
        
        // UITextFieldをViewに追加する.
//        self.view.addSubview(myTextField)
        
        // UITextFieldを作成する.
        myTitleField = UITextField(frame: CGRectMake(0,0,200,30))
        // 表示する文字を代入する.
        myTitleField.text = "title"
        // 枠を表示する.
        myTitleField.borderStyle = UITextBorderStyle.RoundedRect
        // UITextFieldの表示する位置を設定する.
        myTitleField.layer.position = CGPoint(x:self.view.bounds.width/2, y: self.view.bounds.height - 200);
        // Viewに追加する.
        self.view.addSubview(myTitleField)
        
        // UITextFieldを作成する.
        myDescriptionField = UITextField(frame: CGRectMake(0,0,200,150))
        
        // 表示する文字を代入する.
        myDescriptionField.text = "description"
        // 枠を表示する.
        myDescriptionField.borderStyle = UITextBorderStyle.RoundedRect
        // UITextFieldの表示する位置を設定する.
        myDescriptionField.layer.position = CGPoint(x:self.view.bounds.width/2, y: self.view.bounds.height - 100);
        // Viewに追加する.
        self.view.addSubview(myDescriptionField)
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
    }
    
    /*
    UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
    */
    func textFieldDidBeginEditing(textField: UITextField){
        print("textFieldDidBeginEditing:" + textField.text!)
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
}
