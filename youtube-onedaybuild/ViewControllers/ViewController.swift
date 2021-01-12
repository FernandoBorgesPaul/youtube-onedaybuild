//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Fernando Borges Paul on 06/01/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    
   
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set itself as the data source and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //Set itseld as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //Get a reference to the video that it was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        //get the reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        //Set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    
    //MARK:- MOdel Delegate Methods
    
    func videosFecthed(_ videos: [Video]) {
        
        //Set the returned videos to our videos property
        self.videos = videos
        
        //refresh the tableView
        tableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //configure the cell with the data
        //Get the video
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        //Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}

