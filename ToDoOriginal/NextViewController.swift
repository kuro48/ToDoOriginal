//
//  NextViewController.swift
//  ToDoOriginal
//
//  Created by 黒川龍之介 on 2022/02/24.
//

import UIKit
import RealmSwift

class NextViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var toDoTilte: UITextField!
    @IBOutlet var toDoDate: UITextField!
    @IBOutlet var toDoContent: UITextView!
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTilte.delegate = self
        toDoDate.delegate = self
        
//        textVIewの枠線追加
//        toDoContent.layer.borderColor = UIColor.black.cgColor
        
//        デートピッカーの設定
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        toDoDate.inputView = datePicker
        datePicker.preferredDatePickerStyle = .wheels
        
        // デートピッカー内の決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        toDoDate.inputView = datePicker
        toDoDate.inputAccessoryView = toolbar
        // Do any additional setup after loading the view.
    }
    
    @objc func done (){
        toDoDate.endEditing(true)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        toDoDate.text = "\(formatter.string(from: Date()))"
    }
    
    @IBAction func save(){
        let newData: Data = Data() //Dataクラスをインスタンス化
        let realm = try! Realm() //Realmのインスタンスを取得
        
        //項目をインスタンスに追加
        newData.title = toDoTilte.text!
        newData.content = toDoContent.text
        newData.date = toDoDate.text!
        
        //インスタンスの情報をデータベースに書き込む
        try! realm.write{
            realm.add(newData)
        }
        
        self.navigationController?.popViewController(animated: true)
        }

}
