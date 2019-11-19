//
//  ContentView.swift
//  apex-stat-tracker
//
//  Created by David Olivares on 11/18/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Image("apexLogo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                TextField("Username", text: $username)
                    .modifier(loginLayout())
                SecureField("Password", text: $password)
                    .modifier(loginLayout())
                NavigationLink(destination: ProfileView()) {
                    Text("Login")
                        .padding(.all, 10)
                        .background(Color.init(red: 179, green: 0, blue: 0))
                        .border(Color.black)
                        .foregroundColor(Color.black)
                    .cornerRadius(40)
                    .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.init(red: 179, green: 0, blue: 0), lineWidth: 5)
                    )
                }
            }
        }
    }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
