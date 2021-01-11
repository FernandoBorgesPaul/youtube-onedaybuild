//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Fernando Borges Paul on 07/01/21.
//

import Foundation

class Model {
    
    func getVideos() {
        
        //Create a URL Object
        let url = URL(string: K.API_URL)
        
        guard url != nil else {
            return
        }
        //Get a URLSession Object
        let session = URLSession.shared
        
        //Get the DataTask frmo the URLSession Object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check if there were any errors
            if error != nil || data == nil {
                return   //It will stop execution here in order to check errors
            }
            
            do {
                //Parsing the data into Video Objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
                
            } catch {
                
            }
        }
        //Kick Off the task
        dataTask.resume()
    }
}
