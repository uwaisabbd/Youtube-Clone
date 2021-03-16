//
//  Model.swift
//  Youtube Clone
//
//  Created by Uwais junaid abbad on 16/03/21.
//

import Foundation


class Model {
    func getVideo(){
        let url = URL(string: Constants.API_KEY)
        
        guard url != nil else{
            return
            
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!){ (data, response,error ) in
            
            // cek kalo ada error
            if error != nil || data == nil{
                return
            }
            
            do{
                // parsing the data into video project
                // memasukan data ke dalamn project video
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            } catch {
                
            }
            
            
        }
        dataTask.resume()
    }
}
