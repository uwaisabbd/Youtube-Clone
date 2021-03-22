import Foundation

protocol ModelDelegate {
  
  func videosFatched(_ videos: [Video])
  
}

class Model {
  
  var delegate: ModelDelegate?
  
  // buat fungsi untuk ngambil data dari Youtube API
  func getVideo(){
    // simpan url ke dalam variabel
    let url = URL(string: Contsants.API_URL)
    
    // kita cek urlnya kosong gak?
    guard url != nil else {
      return
    }
    
    // mendapatkan URLSession dari object
    let session = URLSession.shared
    
    // mendapatkan data dari URLSession
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
      
      // cek kalo ada error
      if error != nil || data == nil{
        return
      }
      
      do {
        // parsing the data into video project
        // memasukkan data ke dalam project video
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let response = try decoder.decode(Response.self, from: data!)
        
        if response.items != nil{
          DispatchQueue.main.async {
            self.delegate?.videosFatched(response.items!)
          }
        }
        
        dump(response)
        
      } catch{
        
      }
      
    }
    
    // mulai bekerja
    dataTask.resume()
  }
}
