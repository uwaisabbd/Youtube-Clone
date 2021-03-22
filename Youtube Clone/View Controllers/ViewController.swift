//
//  ViewController.swift
//  Youtube Clone
//
//  Created by Muhammad Said Ramadhan on 15/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    func videosFatched(_ video: [Video]) {
        self.videos = video
        
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Contsants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        // Do any additional setup after loading the view.
        model.getVideo()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Ngecek Jika Ada Video Yang Dipilih
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        // buat variabel video yang dipilih
        let selectedvideos = videos[tableView.indexPathForSelectedRow!.row]
        
        //buat variabel untuk halaman detail
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.video = selectedvideos
    }
}
