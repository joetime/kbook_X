//
//  Song.swift
//  kBook_X
//
//  Created by Joseph Scala on 6/11/18.
//  Copyright © 2018 Wreck-All Labs. All rights reserved.
//
// init code from https://developer.apple.com/swift/blog/?id=37

import Foundation

public class Song {
    
    public var SongId:String = ""
    public var SongTitle:String = ""
    public var ArtistName:String = ""
    public var ArtistId:Int = 0
    public var Notes:String = ""
    public var Lyrics:String = ""
    public var DateAdded:String = ""
    
    // INIT
    init(json: [String: Any]) throws {
        
        // Extract values
        self.SongId = json["SongId"] as! String
        self.SongTitle = json["SongTitle"] as! String
        self.ArtistName = json["ArtistName"] as! String
        self.ArtistId = json["ArtistId"] as! Int
        self.Notes = json["Notes"] as! String
        self.Lyrics = json["Lyrics"] as! String
        self.DateAdded = json["DateAdded"] as! String
    }
    
    // TO JSON
    public func toJson() -> String {
        
        var dict = Dictionary<String, Any>()
        dict["SongId"] = self.SongId
        dict["SongTitle"] = self.SongTitle
        dict["ArtistName"] = self.ArtistName
        dict["ArtistId"] = self.ArtistId
        dict["Notes"] = self.Notes
        dict["Lyrics"] = self.Lyrics
        dict["DateAdded"] = self.DateAdded
        
        do {
            
            let data = try JSONSerialization.data(withJSONObject: dict, options:JSONSerialization.WritingOptions(rawValue: 0))
            return String(data: data, encoding: String.Encoding.utf8)!
            
        } catch {
            
            // handle error
            print("Unexpected error: \(error).")
            return ""
        }
    }
    
    //    init(_songTitle:String, _artistName:String, _lyrics:String) {
    //        self.SongTitle = _songTitle
    //        self.ArtistName = _artistName
    //        self.Lyrics = _lyrics
    //    }
}
