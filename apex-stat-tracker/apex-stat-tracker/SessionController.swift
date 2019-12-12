//
//  SessionController.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 12/6/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth
import Combine

class SessionController : ObservableObject {
    @Published var session: User?
    @Published var handle: AuthStateDidChangeListenerHandle?
    @Published var db = Firestore.firestore()
    @Published var dbResult : [String:String] = [:]
    
    func createUser (email: String, xbox: String?, ps4: String?, pc: String?) {
        
        db.collection("users").document(email).setData([
            "xbox": xbox ?? "nil",
            "ps4": ps4 ?? "nil",
            "pc": pc ?? "nil"
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    func updateXbox(email: String, xbox: String){
        db.collection("users").document(email).setData([ "xbox": xbox ], merge: true)
    }
    func updatePs4(email: String, ps4: String){
        db.collection("users").document(email).setData([ "ps4": ps4 ], merge: true)
    }
    func updatePc(email: String, pc: String){
        db.collection("users").document(email).setData([ "pc": pc ], merge: true)
    }
    func getUserInfo(email: String, closure: @escaping () -> Void){
        let docRef = db.collection("users").document(email)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                var newdict = [String:String]()
                guard let doc = document.data() else {
                    print("fail")
                    return
                }
                for (key, value) in doc {
                    newdict[key] = "\(value)"
                }
                self.dbResult = newdict
                closure()
            } else {
                print("Document does not exist")
                print(error)
            }

        }
        
    }
    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(user)")
                print(user.uid)
                print(user.email)
                self.session = User(
                    uid: user.uid,
                    displayName: "",
                    email: user.email
                )
            } else {
                // if we don't have a user, set our session to nil
                self.session = nil
            }
        }
    }
    
    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }

    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
    
    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
}
