//
//  temp.swift
//  Music Store
//
//  Created by Rave Bizz on 6/23/21.
//

import Foundation

class UserModel {
    let shared = UserModel()
    var user:User?
    func setUser(user: User){
        self.user = user
    }
}

