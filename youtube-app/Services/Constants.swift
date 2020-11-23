//
//  Constants.swift
//  youtube-app
//
//  Created by Mohamed Dabbour on 11/20/20.
//

import Foundation
struct Constants {
    
    static var API_KEY = "AIzaSyBDedf1HvnavJOsQX7pf8fEE89nFIy5d2U"
    static var PLAYLIST_ID = "PLipu7zqGy8zRXehXPGDw8x3UX6P43iIYZ"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PLAYLIST_ID)&key=\(API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
}
