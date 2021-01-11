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
        let cell = tableView.dequeueReusableCell(withIdentifier: K.VIDEOCELL_ID, for: indexPath)
        
        //configure the cell with the data
        //Get the title for the video
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        //Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}

