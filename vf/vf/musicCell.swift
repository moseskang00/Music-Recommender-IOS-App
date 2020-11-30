//
//  musicCell.swift
//  vf
//
//  Created by Moses Kang on 11/29/20.
//

import UIKit

class musicCell: UITableViewCell {

    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artistTitle: UILabel!
    
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var trackTitle: UILabel!
    func setMusic(music: trackObject){
        artist.text = music.trackArtists
        trackTitle.text = music.trackName
    }
    

}
