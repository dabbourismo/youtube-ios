//
//  ViewController.swift
//  youtube-app
//
//  Created by Mohamed Dabbour on 11/20/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var apiService = ApiService()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        apiService.delegate = self
        
        apiService.getVideos()
        
    }
    
    //MARK:SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Confirm the video is selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //Get reference to video was tapped
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //Get reference to DetailViewController
        let detailViewController = segue.destination as! DetailViewController
        
        //Set video Propertie of detail view controller
        detailViewController.videoToDisplay = selectedVideo
        
        
    }
}
// MARK:- TableView Methods:
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID,for: indexPath) as! VideoTableViewCell
        
        // TODO: Configure the cell with data
        cell.setCell(videos[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK:- ApiResponse Delegate
extension ViewController:ApiResponseDelegate{
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
}

