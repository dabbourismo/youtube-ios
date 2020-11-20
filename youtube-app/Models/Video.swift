//
//  Video.swift
//  youtube-app
//
//  Created by Mohamed Dabbour on 11/20/20.
//

import Foundation
struct Video : Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    //Map each propertie with the key name inside the json response
    enum CodingKeys : String, CodingKey {
        //outer keys
        case snippet
        case thumbnails
        case high
        case resourceId
        
        //inner keys كل حالة بتساوي الاسم الصحيح ليها في الرسيبونس
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init(from decoder: Decoder) throws {
        //items container (outer container)
        let container =  try! decoder.container(keyedBy: CodingKeys.self)
        
        //snippet object (container)
        let snippetContainer = try! container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //Parse items inside teh snippet container
        self.title = try! snippetContainer.decode( String.self, forKey: .title)
        self.description = try! snippetContainer.decode(String.self,forKey: .description)
        self.published = try! snippetContainer.decode(Date.self,forKey: .published)
        
        //thumbnail object (container)
        let thumbnailContainer = try! snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try! thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        //items inside the high container
        self.thumbnail = try! highContainer.decode(String.self, forKey: .thumbnail)
        
        let resourceIdContainer = try! snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try! resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}


//Example of resonse

/*
 "items": [
     {
       "kind": "youtube#playlistItem",
       "etag": "9e9fInU9KxEgTE7KLUg2ew0W4Ko",
       "id": "UExpcHU3enFHeTh6UlhlaFhQR0R3OHgzVVg2UDQzaUlZWi41NkI0NEY2RDEwNTU3Q0M2",
       "snippet": {
         "publishedAt": "2018-06-01T16:57:03Z",
         "channelId": "UCnm8_E5shhNNGn7CZ0boD6g",
         "title": "Introduction Entity Framework 6 00 00",
         "description": "Introduction Entity Framework 6\n\nSpecial thanks to Julie Lerman for creating this resource",
         "thumbnails": {
           "default": {
             "url": "https://i.ytimg.com/vi/fTMwRmZy9wM/default.jpg",
             "width": 120,
             "height": 90
           },
           "medium": {
             "url": "https://i.ytimg.com/vi/fTMwRmZy9wM/mqdefault.jpg",
             "width": 320,
             "height": 180
           },
           "high": {
             "url": "https://i.ytimg.com/vi/fTMwRmZy9wM/hqdefault.jpg",
             "width": 480,
             "height": 360
           },
           "standard": {
             "url": "https://i.ytimg.com/vi/fTMwRmZy9wM/sddefault.jpg",
             "width": 640,
             "height": 480
           },
           "maxres": {
             "url": "https://i.ytimg.com/vi/fTMwRmZy9wM/maxresdefault.jpg",
             "width": 1280,
             "height": 720
           }
         },
         "channelTitle": "P&D Solution",
         "playlistId": "PLipu7zqGy8zRXehXPGDw8x3UX6P43iIYZ",
         "position": 0,
         "resourceId": {
           "kind": "youtube#video",
           "videoId": "fTMwRmZy9wM"
         }
       }
     },
 */
