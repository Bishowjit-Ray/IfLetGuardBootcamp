//
//  ContentView.swift
//  xc
//
//  Created by Bishowjit Ray on 23/9/22.
//

import SwiftUI

struct ContentView: View {
    @State var currentUserID: String? = "123"
    @State var displaytext: String? = nil
    @State var isloading: Bool = false
    var body: some View {
        NavigationView{
            VStack{
                Text("here are practicing safe coding!")
                if let text = displaytext{
                    Text(text)
                        .font(.title)
                }
                if isloading{
                    ProgressView()
                }
               
                Spacer()
            }
            .navigationTitle("Safe coding")
            .onAppear{
                loadData2()
            }
        }
    }
    func loadData(){
        
        isloading = true
        
        if let userID = currentUserID{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
                displaytext = " This is thw new data!! User is is: \(userID)"
                isloading = false
                
            }
          
        }
        else {
            displaytext = "Error. There is no User ID!"
        }
       
    }
    
    func loadData2(){
        guard let userID = currentUserID else{
            displaytext = "Error. There is no User ID! "
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
            displaytext = " This is thw new data!! User is is: \(userID)"
            isloading = false
            
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
