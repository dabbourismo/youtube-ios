//
//  VideoTableViewCell.swift
//  youtube-app
//
//  Created by Mohamed Dabbour on 11/26/20.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    var video : Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(_ video:Video){
        self.video = video
        
        //Title
        lblTitle.text = video.title
        
        //Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        lblDate.text = dateFormatter.string(from: video.published)
        
        //Check cache first
        if let cachedData = CachManager.getvideoCach(video.thumbnail) {
            //set thumbmail
            imgThumbnail.image = UIImage(data: cachedData)
            return
        }
                
        //Image
        let url = URL(string: video.thumbnail)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil{
                
                //Save in cache
                CachManager.setVideoCache(url!.absoluteString, data!)
                
                if url!.absoluteString != video.thumbnail {
                    return
                }
            }
                        
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                self.imgThumbnail.image = image
            }
        }
        dataTask.resume()
    }

}
