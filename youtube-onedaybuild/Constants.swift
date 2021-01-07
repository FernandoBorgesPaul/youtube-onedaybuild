//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Fernando Borges Paul on 07/01/21.
//

import Foundation


struct  K {
  static var API_KEY = ""
  static var PLAYLIST_ID = "RDOXkhZ8IxFSQ"
  static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(K.PLAYLIST_ID)&key=\(K.API_KEY)"
}
