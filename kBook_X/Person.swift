//
//  Person.swift
//  kBook_X
//
//  Created by Joseph Scala on 6/10/18.
//  Copyright © 2018 Wreck-All Labs. All rights reserved.
//

import Foundation

public class Person {
    
    // init code from https://developer.apple.com/swift/blog/?id=37
    init(json: [String: Any]) throws {
        // Extract name
        let _name = json["name"] as? String
        let _age = json["age"] as? String
        let _employed = json["employed"] as? String
        
        // Initialize properties
        self.name = _name!
        if (_age != nil) { self.age = _age! }
        if (_employed != nil) { self.employed = _employed! }
    }
    
    public var name:String = ""
    public var age:String = ""
    public var employed:String = ""
}
