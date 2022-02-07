//
//  Verification.swift
//  RodnikApp
//
//  Created by Igor on 31.01.2022.
//

import SwiftUI

struct Verification: View {
    @ObservedObject var loginData : LoginViewModel
    @Environment(\.presentationMode) var present
    var body: some View {
    
        ZStack{
            
            VStack{
                
                VStack{
                           
                           HStack{
                               
                               Button(action: {present.wrappedValue.dismiss()}) {
                                   
                                   Image(systemName: "arrow.left")
                                       .font(.title2)
                                       .foregroundColor(.black)
                               }
                               
                               Spacer()
                               
                               Text("Проверка Телефона")
                                   .font(.title2)
                                   .fontWeight(.bold)
                                   .foregroundColor(.black)
                               
                               Spacer()
                               
                               if loginData.loading{ProgressView()}
                           }
                           .padding()
                    
                    Text("Код выслан на номер \(loginData.phNo)")
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 15){
                        
                        ForEach(0..<6,id: \.self){index in
                            
                            // displaying code
                            
                            CodeView(code: getCodeAtIndex(index: index))
                        }
                    }
                    .padding()
                    .padding(.horizontal,20)
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 6){
                        
                        Text("Не получили код?")
                            .foregroundColor(.gray)
                        
                        Button(action: loginData.requestCode) {
                            
                            Text("Попробуйте заново")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Button(action: {}) {
                        
                        Text("Получить на сотовый")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(.top,6)
                    
                    Button(action: loginData.verifyCode) {
                        
                        Text("Проверить и Создать Пользователя")
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color("base"))
                            .cornerRadius(15)
                    }
                    .padding()
                }
                .frame(height: UIScreen.main.bounds.height / 1.8)
                .background(Color.white)
                .cornerRadius(20)
                
                CustomNumberPad(value: $loginData.code, isVerify: true)
                
            }
            .background(Color("bg").ignoresSafeArea(.all, edges: .bottom))
            
            if loginData.error{
                
                AlertView(msg: loginData.errorMsg, show: $loginData.error)
            }
        }
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    // getting Code at Each Index
    func getCodeAtIndex(index: Int) -> String{
        
        if loginData.code.count > index{
            
            let start = loginData.code.startIndex
            
            let current = loginData.code.index(start, offsetBy: index)
            
            return String(loginData.code[current])
        }
        
        return ""
    }
}

struct CodeView: View {
    
    var code: String
    
    var body: some View{
        
        VStack(spacing: 10){
            
            Text(code)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.title2)
                .frame(height: 45)
            
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 4)
        }
    }
}
