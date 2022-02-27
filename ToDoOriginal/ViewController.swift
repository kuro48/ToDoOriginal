//
//  ViewController.swift
//  ToDoOriginal
//
//  Created by 黒川龍之介 on 2022/02/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    let realm = try! Realm()
    var toDoList: Results<Data>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
        self.toDoList = realm.objects(Data.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = table.indexPathForSelectedRow{
                table.deselectRow(at: indexPath, animated: true)
            }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(Data.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        cell.textLabel!.text = toDoList[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            try! realm.write{
                let item = toDoList[indexPath.row]
                realm.delete(item)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
//    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to : IndexPath) {
//        try! realm.write{
//            let listItem = toDoList[fromIndexPath.row]
//            toDoList.remove(at: fromIndexPath.row)
//            toDoList.insert(listItem, at: to.row)
//        }
//    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    @IBAction func toNextButton(_ sender: Any) {
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    

}

