//
//  ItemModel.swift
//  Todo23
//
//  Created by BS00834 on 29/5/24.
//

import Foundation

struct ItemModel : Identifiable, Codable{
    var id: String
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
