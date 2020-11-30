//
//  navigationViewController.swift
//  vf
//
//  Created by Moses Kang on 11/29/20.
//

import UIKit

class navigationViewController: UIViewController {

    let api = apiObject()
    var albumName:String?
    var albumID:String?
    var artistSelect:String?
    var gate = true
    var gate1 = true
    var checker = true
    var checher1 = true
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(artistSelect)
        downloadImage(artist: artistSelect!)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController: recommendViewController = segue.destination as? recommendViewController{
            viewController.artistSelect = self.artistSelect
            //viewController.genreSelect = self.genreSelected
            print("////////navigator//////////")
            print(self.artistSelect)
            //print(viewController.genreSelect)
        }
    }
    
    func downloadImage(artist: String){
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
                        self.albumID = tempAlbum["strAlbumThumb"] as? String
                        print(self.albumID)
                        if self.albumID == nil{
                            self.checher1 = false
                        }
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
                let url = URL(string: self.albumID!)
                if let data = try? Data(contentsOf: url!){
                    imageView.image = UIImage(data: data)
                    gate = true
                    checher1 = false
                }
                //print("done")
                //gate = true
                //checher1 = false
            }
            //return tempCreateArray
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
