//
//  ItemModel.swift
//  TodoList
//
//  Created by Jason on 2023/9/18.
//

import Foundation

struct ItemModel : Identifiable, Codable {
    let id: String // id
    let title: String // 标题
    let isCompleted: Bool // 是否完成
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(title: title, isCompleted: !isCompleted)
    }
    
}
