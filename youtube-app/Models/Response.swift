//
//  Response.swift
//  youtube-app
//
//  Created by Mohamed Dabbour on 11/20/20.
//

import Foundation

struct Response:Decodable {
    //response array
    var items:[Video]?
    
    enum CodingKeys:String,CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        //Items super container
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try! container.decode([Video].self, forKey: .items)
    }
    
}
