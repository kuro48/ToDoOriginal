//
//  ViewController.swift
//  ToDoOriginal
//
//  Created by 黒川龍之介 on 2022/02/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {
    
    let realm = try! Realm()
    @IBOutlet var table: UITableView!
    
    var toDoList: Results<Data>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        
        let realm = try! Realm()
        self.toDoList = realm.objects(Data.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "テスト"
        
        return cell!
    }
    
    @IBAction func toNextButton(_ sender: Any) {
        performSegue(withIdentifier: "toNext", sender: nil)
    }

}

