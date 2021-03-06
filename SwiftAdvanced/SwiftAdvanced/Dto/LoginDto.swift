//
//  LoginDto.swift
//  BaseAdapters
//
//  Created by kasturi gopal on 08/02/17.
//  Copyright © 2017 axionet. All rights reserved.
//

import UIKit

class LoginDto:NSObject, Mappable {
    
    var userNameText = String()
    var passwordText = String()
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        userNameText    <- map["userName"]
        passwordText         <- map["password"]
    }
    
}
