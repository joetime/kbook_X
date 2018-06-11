//
//  DataStore.swift
//  kBook_X
//
//  Created by Joseph Scala on 6/11/18.
//  Copyright © 2018 Wreck-All Labs. All rights reserved.
//

import Foundation

public class kbDataStore {
    
    let fileName = "kbAllData.json" // where we store data for real
    let testFileName = "test.json"    // for testing purposes
    var filePath = ""
    
    public var Artists = [String]()
    public var Songs = [Song]()
    
    init() {
        
        // Find documents directory on device, set up path
        let dirs : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        if dirs.count > 0 {
            let dir = dirs[0] //documents directory
            filePath = dir.appending("/" + fileName)
            print("Local path = \(filePath)")
        } else {
            
            print("Could not find local directory to store file")
            return
        }
        
        load()
    }
    
//    convenience init(persons:[Person]) {
//
//        self.init()
//        Persons = persons
//    }
    
//    func save() {
//        let fileContentToWrite = Persons[0].toJson()
//        do {
//            // Write contents to file
//            try fileContentToWrite.write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
//        }
//        catch let error as NSError {
//            print("An error took place: \(error)")
//        }
//    }
    
    func load() {
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let songsArray = jsonResult["songs"] as? [Any] {
                
                // loop items
                for case let pJson in songsArray {
                    let song = try Song(json: pJson as! [String : Any])
                    Songs.append(song)
                }
            }
        } catch {
            // handle error
            print("Unexpected error: \(error).")
        }
    }
}
