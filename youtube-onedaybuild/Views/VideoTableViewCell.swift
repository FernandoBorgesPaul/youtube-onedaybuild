//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Fernando Borges Paul on 11/01/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        self.video = v
        
        
        //Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        //set the title
        self.titleLabel.text = video?.title
        //Set the date
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "EEEE, MMM d, yyyy"
        
        self.dateLabel.text = dFormatter.string(from: video!.published)
        
        //Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //Check cache before downloading data
        if let cacheData =  CacheManager.getVideoCache(self.video!.thumbnail) {
            //Set the thumbnail image View
            
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        
       // Download the thumbnail data. If it was already downloaded and added to the cache, it won't go thrhough here anymore.
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL session
        let session = URLSession.shared
        
        //Create data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                //Save the data in the cache
                CacheManager.setVIdeoCache(url!.absoluteString, data)
                
                
                //Check that the downloaded url matches the video thumbnail that this cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail {
                    //VideoCell has been recycled for another video and no loger matches the thumbnail tath was downloaded
                    return
                }
                
                //create the image Object
                let image = UIImage(data: data!)
                //Set the imageView
                DispatchQueue.main.async {
                    self.thumbnailImageView?.image = image
                }
            }
        }
        dataTask.resume()
    }
}
