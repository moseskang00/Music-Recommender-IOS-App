//
//  apiObject.swift
//  vf
//
//  Created by Moses Kang on 11/29/20.
//

import Foundation

class apiObject{
    
    let apiKey:String = "523532"
    
    //MARK: get album list
    func getAlbumList(artist:String, completionHandler: @escaping (Result<NSDictionary, Error>) -> ()) {
        let initialURL = "http://theaudiodb.com/api/v1/json/1/discography.php?s=\(artist)"
        let strWithNoSpace = initialURL.replacingOccurrences(of: " ", with: "%20")
        //print(initialURL)
        let finalURL = URL(string: strWithNoSpace)!
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: finalURL) {(data, response, error) in
            if error == nil {
                let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                //print(jsonResult)
                completionHandler(.success(jsonResult))
            }
        }
        task.resume()
    }
    
    //MARK: getting album info
    //this is where i get album data
    func getAlbumInfo(artist: String, album: String, completionHandler: @escaping (Result<NSDictionary, Error>) -> ()) {
        let initialurl = "http://theaudiodb.com/api/v1/json/1/searchalbum.php?s=\(artist)&a=\(album)"
        let strWithNoSpace = initialurl.replacingOccurrences(of: " ", with: "_")
        //print(initialurl)
        let finalURL = URL(string: strWithNoSpace)!
        let urlSession = URLSession.shared
        let albumTask = urlSession.dataTask(with: finalURL) {(data, response, error) in
            if error == nil {
                let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                //print(jsonResult)
                completionHandler(.success(jsonResult))
            }
        }
        albumTask.resume()
    }
    
//MARK: getting track listing
    
    //this is where i get album tack listing
    func getTrackListing(albumID: String, completionHandler: @escaping (Result<NSDictionary, Error>) -> ()) {
        let initialURL = "http://theaudiodb.com/api/v1/json/1/track.php?m=\(albumID)"
        print(initialURL)
        let finalURL = URL(string: initialURL)!
        let urlSession = URLSession.shared
        let trackTask = urlSession.dataTask(with: finalURL) {(data, response, error) in
            if error == nil {
                let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                //print(jsonResult)
                completionHandler(.success(jsonResult))
            }
        }
        trackTask.resume()
    }
    
    func getData(url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url).resume()
    }
    
}
