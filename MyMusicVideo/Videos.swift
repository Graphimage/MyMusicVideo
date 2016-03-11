//
//  MusicVideo.swift
//  MyMusicVideo
//
//  Created by Gary on 3/11/16.
//  Copyright © 2016 Gary. All rights reserved.
//

import Foundation

class Videos {
    
    private var _vName: String
    private var _Rights: String
    private var _Price: String
    private var _vImageUrl: String
    private var _vArtist: String
    private var _vVideoUrl: String
    private var _vImid: String
    private var _vGenre: String
    private var _vLinkToiTunes: String
    private var _vReleaseDate: String
    
    
    //variable gets created from the UI
    var vImageData: NSData?
    
    //make getter
    
    var vName: String   {
        return _vName
    }
    
    var vRights: String {
        return _Rights
    }
    
    var vPrice: String {
        return _Price
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vArtist: String {
        return _vArtist
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vImid: String {
        return _vImid
    }
    
    var vGenre: String {
        return _vGenre
    }
    
    var vLinkToiTunes: String {
        return _vLinkToiTunes
    }
    
    var vReleaseDate String {
        return _vReleaseDate
    }
    
    init(data: JSONDictionary) {
        
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
                self._vName = vName
        }
        else {
            _vName = ""
        }
 
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
                _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else {
            _vImageUrl = ""
        }
        
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
                self._vVideoUrl = vVideoUrl
        }
        else {
            _vName = ""
        }
        
    }
}