//
//  User.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 12/6/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import Foundation

class User {
    var uid: String
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }

}
