//
//  recommendViewController.swift
//  vf
//
//  Created by Moses Kang on 11/29/20.
//

import UIKit

class recommendViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let api = apiObject()
    var albumName:String?
    var albumID:String?
    var artistSelect:String?
    var gate = true
    var gate1 = true
    var checker = true
    var checher1 = true
    var mainCheck = true
    var mainGate = true
    var tracks:[trackObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tracks = createArray()
        do {
            sleep(2)
        }
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func createArray() -> [trackObject] {
        var tempCreateArray:[trackObject] = []
        
        api.getAlbumList(artist: artistSelect!){ results in
            switch results{
            case .success(let temp):
                let dataArray = temp["album"] as! NSArray
                //print(dataArray)
                let tempAlbum = dataArray[0] as! NSDictionary
                self.albumName = tempAlbum["strAlbum"] as? String
                print(self.albumName!)
                self.gate = false
            case .failure(let error):
                print(error.localizedDescription)
                self.gate = false
            }
        }

        while checker {
            //print(gate)
            if gate == false {
                self.checker = false
                self.api.getAlbumInfo(artist: self.artistSelect!, album: self.albumName!){ results in
                    self.gate = true
                    switch results{
                    case .success(let temp):
                        let dataArray = temp["album"] as! NSArray
                        let tempAlbum = dataArray[0] as! NSDictionary
                        self.albumID = tempAlbum["idAlbum"] as? String
                        print(self.albumID)
                        self.gate1 = false
                        self.gate = false
                        self.checker = false
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.gate1 = false
                        self.gate = false
                        self.checker = false
                    }
                }
            }
        }
        
        while checher1 {
            //print(checher1)
            if gate == false && gate1 == false {
                self.checher1 = false
                self.api.getTrackListing(albumID: self.albumID!){ results in
                    switch results{
                    case .success(let temp):
                        let dataArray = temp["track"] as! NSArray
                        if dataArray.count > 10 {
                            for i in 0..<10 {
                                let tempTrack = dataArray[i] as! NSDictionary
                                let tempSong = trackObject(name: tempTrack["strTrack"] as! String, artists: tempTrack["strArtist"] as! String)
                                tempCreateArray.append(tempSong)
                                print(tempSong.trackName)
                            }
                        }
                        else {
                            for i in 0..<dataArray.count{
                                let tempTrack = dataArray[i] as! NSDictionary
                                let tempSong = trackObject(name: tempTrack["strTrack"] as! String, artists: tempTrack["strArtist"] as! String)
                                tempCreateArray.append(tempSong)
                            }
                        }
                        self.checher1 = false
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.checher1 = false
                    }
                }
            }
            //return tempCreateArray
        }
        do {
            sleep(1)
        }
        return tempCreateArray
    }

}

extension recommendViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(tracks.count)
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let temp = tracks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicC") as! musicCell
        cell.setMusic(music: temp)
        return cell
    }
}
