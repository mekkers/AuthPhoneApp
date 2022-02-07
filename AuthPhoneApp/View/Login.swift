//
//  Login.swift
//  RodnikApp
//
//  Created by igor mekkers on 31.01.2022.
//

import SwiftUI

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    @State var isSmall = UIScreen.main.bounds.height < 750
    var body: some View {
        
        ZStack{
            
            VStack{
                       
                   VStack{
                       
                       Text("Продолжить с телефоном")
                           .font(.title2)
                           .fontWeight(.bold)
                           .foregroundColor(.black)
                       
                       Image("logo")
                           .aspectRatio(contentMode: .fit)
                           
                       
                       Text("Вы получите 4-x значный цифровой код для следующей проверки.")
                           .font(isSmall ? .none : .title2)
                           .foregroundColor(.gray)
                           .multilineTextAlignment(.center)
                          
                       
                       HStack{
                           VStack(alignment: .leading, spacing: 6) {
                               
                               Text("Введите ваш номер")
                                   .font(.caption)
                                   .foregroundColor(.gray)
                               
                               Text("+ \(loginData.getCountryCode()) \(loginData.phNo)")
                                   .font(.title2)
                                   .fontWeight(.bold)
                                   .foregroundColor(.black)
                           }
                           Spacer(minLength: 0)
                           
                           NavigationLink(destination: Verification(loginData: loginData),isActive: $loginData.gotoVerify) {
                               
                               Text("")
                                   .hidden()
                               
                           }
                           
                           Button(action: loginData.sendCode, label: {
                               
                               Text("Продолжить")
                                       .foregroundColor(.black)
                                       .padding(.vertical,18)
                                       .padding(.horizontal,34)
                                       .background(Color("base"))
                                       .cornerRadius(15)
                           })
                           
                           .disabled(loginData.phNo == "" ? true: false)
                       }
                       .padding()
                       .background(Color.white)
                       .cornerRadius(20)
                       .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
                   }
                   .frame(height: UIScreen.main.bounds.height / 1.8)
                   .background(Color.white)
                   .cornerRadius(20)
                       
                   
                      // Custom Number Pad
                       
                       CustomNumberPad(value: $loginData.phNo, isVerify: false)
                       
                       }
                   .background(Color("bg").ignoresSafeArea(.all, edges: .bottom))
            
            if loginData.error{
                
                AlertView(msg: loginData.errorMsg, show: $loginData.error)
            }
        }
            
    }
}


