//
//  ApiService.swift
//  youtube-app
//
//  Created by Mohamed Dabbour on 11/20/20.
//

import Foundation

protocol ApiResponseDelegate {
    func videosFetched(_ videos:[Video])
}


class ApiService {
    
    var delegate : ApiResponseDelegate?
    
    func getVideos(){
        //Create url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //Get url session object
        let session = URLSession.shared
        
        //Get data task
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            //Check for any errors
            if error != nil || data == nil{
                return
            }
            //Parsing the data to video objects
            
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                //Call videosFetched
                if response.items != nil{
                    self.delegate?.videosFetched(response.items!)
                }
                
                
                dump(response)
            }
            catch{
                
            }
           
        }
        
        //start the task
        datatask.resume()
    }
    
    
}
