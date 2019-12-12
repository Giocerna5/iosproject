//
//  LogInView.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 12/10/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import SwiftUI

struct LogInView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var error: Bool = false
    @State var successLogIn: Int? = 0
    
    @EnvironmentObject var viewModel: AccountViewModel
    @EnvironmentObject var sessionController: SessionController
    
    var body: some View {
        NavigationView {
            VStack {
                Image("apexLogo")
                    .resizable()
                    .frame(width: CGFloat(200), height: CGFloat(200))
                    .padding()
                TextField("Username", text: $username)
                    .modifier(loginLayout())
                SecureField("Password", text: $password)
                    .modifier(loginLayout())
                NavigationLink(destination: ProfileView(), tag: 1, selection: $successLogIn) {
                    Button(action: self.logIn){
                            Text("Login")
                                .padding(.all, CGFloat(10))
                                .background(Color.init(red: 179.0, green: 0.0, blue: 0.0))
                                .border(Color.black)
                                .foregroundColor(Color.black)
                            .cornerRadius(CGFloat(40))
                            .overlay(RoundedRectangle(cornerRadius: CGFloat(40))
                                .stroke(Color.init(red: 179.0, green: 0.0, blue: 0.0), lineWidth: CGFloat(5))
                                )

                        }
                }
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .padding(.all, CGFloat(8))
                        .background(Color.init(red: 179.0, green: 0.0, blue: 0.0))
                        .border(Color.black)
                        .foregroundColor(Color.black)
                    .cornerRadius(CGFloat(40))
                    .overlay(RoundedRectangle(cornerRadius: CGFloat(40))
                        .stroke(Color.init(red: 179.0, green: 0.0, blue: 0.0), lineWidth: CGFloat(5))
                        )
                }
                .padding(.top)
            }
        }.onAppear(perform: sessionController.listen)
    }
    
    func logIn(){
        
        self.sessionController.signIn(email: username, password: password) { (result, error) in
                
            print(result)
            print(error)
            if error != nil {
                self.error = true
            }
            else {
                self.username = ""
                self.password = ""
                self.successLogIn = 1
            }
            
        }
    }// func
}

struct loginLayout: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .padding(.horizontal, 100)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .environmentObject(AccountViewModel()).environmentObject(SessionController())
    }
}
