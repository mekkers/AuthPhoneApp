//
//  Home.swift
//  AuthPhoneApp
//
//  Created by Igor on 04.02.2022.
//

import SwiftUI
import Firebase

struct Home: View {
    @AppStorage("log_Status") var status = false
    var body: some View {
      
        VStack(spacing: 15){
            
            //Home View
            Text("Вход выполнен успешно")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
            Button(action: {
               try! Auth.auth().signOut()
                withAnimation{status = false}
            }, label: {
                Text("Выход")
                    .fontWeight(.heavy)
            })
          
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
