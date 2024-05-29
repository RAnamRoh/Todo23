//
//  AddItemView.swift
//  Todo23
//
//  Created by BS00834 on 29/5/24.
//

import SwiftUI

struct AddItemView: View {
    
    @State var textFieldText : String = ""
    @EnvironmentObject var listViewModel : ListViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView {
            VStack{
                TextField("Add Item", text: $textFieldText)
                    .padding()
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.4))
                    .clipShape(.rect(cornerRadius: 20))
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .padding()
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 20))
                })
            }
            .padding()
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(alertTitle, isPresented: $showAlert) {
            
        }
    }
    
    
    func saveButtonPressed(){

        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            dismiss.callAsFunction()
        }else{
            alertTitle = "Item Needs to Be more than 3 Characters"
            showAlert.toggle()
        }
        
        
        
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            return false
        }
        return true
    }
    
}

#Preview {
    NavigationStack{
        AddItemView()
    }
    .environmentObject(ListViewModel())
    
}
