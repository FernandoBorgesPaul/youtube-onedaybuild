//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Fernando Borges Paul on 07/01/21.
//

import Foundation

struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet     = "snippet"
        case thumbnails  = "thumbnails"
        case high        = "high"
        case resourceId  = "resourceId"
        
        case published   = "publishedAt"
        case title       = "title"
        case description = "description"
        case thumbnail   = "url"
        case videoId     = "videoId"
    }
    
    init(from decoder: Decoder) throws {
        
       let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //Parse Title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        //Parse Description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        //Parse Publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        //Parse Thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //Parse Video ID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
    }
    
}
