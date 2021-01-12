//
//  DetailViewController.swift
//  youtube-onedaybuild
//
//  Created by Fernando Borges Paul on 11/01/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        //Check if there is a video
        guard video != nil else {
            return
        }
        
        //Create the embeded URL
        let urlComplement = "&ab_channel=APerfectCircleVEVO"
        let embededURLString = K.EMBEDED_URL + video!.videoId + urlComplement
       
        //Load it to the webView
        let url = URL(string: embededURLString)
        let request = URLRequest(url: url!)
        print(request)
        webView.load(request)
        
        //Set the title
        titleLabel.text = video!.title
        //Set the date
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = dFormatter.string(from: video!.published)
        
        //Set teh Description
        textView.text = video!.description
    }
    
    
    

}
