//
//  ToDoData.swift
//  ToDoOriginal
//
//  Created by 黒川龍之介 on 2022/02/21.
//

import Foundation
import RealmSwift

class Data: Object{
    @objc dynamic var title: String = "default"
    @objc dynamic var content: String = "default"
    @objc dynamic var date: String = "default"
}

class DataList: Object{
    let list = List<Data>()
}
