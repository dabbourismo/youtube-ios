//
//  CachManager.swift
//  youtube-app
//
//  Created by Mohamed Dabbour on 11/26/20.
//

import Foundation
class CachManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?){
        cache[url] = data
    }
    
    static func getvideoCach(_ url:String) -> Data? {
        return cache[url]
    }
}
