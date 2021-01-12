//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Fernando Borges Paul on 11/01/21.
//

import Foundation

class CacheManager {
    static var cache = [String: Data]()
    
    static func setVIdeoCache(_ url: String, _ data: Data?) {
        //Store the image date and use the url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url: String)-> Data? {
        //Try to tget the data form the specify url
        return cache[url]
    }
}
