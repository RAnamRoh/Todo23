//
//  ListRowView.swift
//  Todo23
//
//  Created by BS00834 on 29/5/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle" )
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,2)
    }
}

#Preview {
    ListRowView(item: ItemModel(title: "A List Item", isCompleted: false))
}
