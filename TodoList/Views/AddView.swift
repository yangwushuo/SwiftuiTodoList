//
//  AddView.swift
//  TodoList
//
//  Created by Jason on 2023/9/18.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Input here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                Button(
                    action: saveButtonPressed,
                    label: {
                        Text("Save")
                            .foregroundStyle(Color.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                )
            }
            .padding(14)
        }
        .navigationTitle("Add item ✒️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        guard textIsAppropriate() else {
            alertTitle = "count must > 3"
            showAlert = true
            return
        }
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
    
    func textIsAppropriate() -> Bool {
        return textFieldText.count > 3
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
