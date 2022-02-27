//
//  DetailViewController.swift
//  ToDoOriginal
//
//  Created by 黒川龍之介 on 2022/02/27.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    var toDoDetail: Data = Data() //Dataクラスをインスタンス化
    let realm = try! Realm()
    
    @IBOutlet weak var detailContent: UITextView!
    @IBOutlet weak var detailDate: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailTitle.text = toDoDetail.title
        detailDate.text = toDoDetail.date
        detailContent.text = toDoDetail.content

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
