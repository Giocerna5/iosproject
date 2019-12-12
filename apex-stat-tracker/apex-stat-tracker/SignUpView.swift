//
//  SignUpView.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 12/10/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var xbox: String = ""
    @State var ps4: String = ""
    @State var pc: String = ""
    @State var error: Bool = false
    
    @EnvironmentObject var sessionController: SessionController
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
            Text("Credentials")
                .foregroundColor(Color.init(red: 179.0, green: 0.0, blue: 0.0)).font(.system(size: 30))
            TextField("Email", text: $username)
                .modifier(loginLayout())
            SecureField("Password", text: $password)
                .modifier(loginLayout())
            Text("Platform Usernames").foregroundColor(Color.init(red: 179.0, green: 0.0, blue: 0.0)).font(.system(size: 28))
            TextField("Xbox", text: $xbox)
            .modifier(loginLayout())
            TextField("PS4", text: $ps4)
            .modifier(loginLayout())
            TextField("PC", text: $pc)
            .modifier(loginLayout())
            Button(action: self.signUp){
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
            }.background(
                Image("apex-galaxy-small")
                    .resizable()
                    .scaledToFill()
                //.edgesIgnoringSafeArea(.all)
            )
            Spacer()
        }.background(Color.black.edgesIgnoringSafeArea(.all))
    }// body
    
    func signUp(){
        self.sessionController.signUp(email: username, password: password) { (result, error) in
                
            print(result)
            print(error)
            if error != nil {
                self.error = true
            }
            else {
                self.username = ""
                self.password = ""
            }
            
        }
        self.sessionController.createUser(email: username.lowercased(), xbox: xbox.lowercased(), ps4: ps4.lowercased(), pc: pc.lowercased())
    }
}// class

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(SessionController())
    }
}
