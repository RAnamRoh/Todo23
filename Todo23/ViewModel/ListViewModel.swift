//
//  ListViewModel.swift
//  Todo23
//
//  Created by BS00834 on 29/5/24.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items : [ItemModel] = [] {
        didSet{
            saveItem()
        }
    }
    
    let itemsKey : String = "items_list"
    
    init() {
        getItem()
    }
    
    
    func getItem(){
//        let newItems = [ItemModel(title: "Item 1", isCompleted: false),
//                        ItemModel(title: "Item 2", isCompleted: true),
//                        ItemModel(title: "Item 3", isCompleted: false)]
//        items.append(contentsOf: newItems)
        
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
                else { return }
        self.items = savedItem
        
    }
    
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item : ItemModel){
        
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
        
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
    
    
    
}
