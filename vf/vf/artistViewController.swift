//
//  artistViewController.swift
//  vf
//
//  Created by Moses Kang on 11/29/20.
//

import UIKit

class artistViewController: UIViewController {

    @IBOutlet weak var art0: UIButton!
    @IBOutlet weak var art1: UIButton!
    @IBOutlet weak var art2: UIButton!
    @IBOutlet weak var art3: UIButton!
    @IBOutlet weak var art4: UIButton!
    @IBOutlet weak var art5: UIButton!
    @IBOutlet weak var art6: UIButton!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var myArtists:artistObject = artistObject()
    var artistSelected:String?
    var genreSelect: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        art0.setTitle(myArtists.getArtist(genre: genreSelect!, position: 0), for: .normal)
        art1.setTitle(myArtists.getArtist(genre: genreSelect!, position: 1), for: .normal)
        art2.setTitle(myArtists.getArtist(genre: genreSelect!, position: 2), for: .normal)
        art3.setTitle(myArtists.getArtist(genre: genreSelect!, position: 3), for: .normal)
        art4.setTitle(myArtists.getArtist(genre: genreSelect!, position: 4), for: .normal)
        art5.setTitle(myArtists.getArtist(genre: genreSelect!, position: 5), for: .normal)
        art6.setTitle(myArtists.getArtist(genre: genreSelect!, position: 6), for: .normal)
        // Do any additional setup after loading the view.
 
    }
    
    @IBAction func action0(_ sender: Any) {
        //print(myArtists.getArtist(genre: genreSelect!, position: 0))
        artistSelected = myArtists.getArtist(genre: genreSelect!, position: 0)
        self.addtocoredata()
        //print("done/cdskdjkdnjkfdjksnfjksnjkfdnjksnfjkds")
        //print(artistSelected)
    }
    @IBAction func action1(_ sender: Any) {
        artistSelected = myArtists.getArtist(genre: genreSelect!, position: 1)
        self.addtocoredata()
    }
    @IBAction func action2(_ sender: Any) {
        artistSelected = myArtists.getArtist(genre: genreSelect!, position: 2)
        self.addtocoredata()

    }
    @IBAction func action3(_ sender: Any) {
        artistSelected = myArtists.getArtist(genre: genreSelect!, position: 3)
        self.addtocoredata()

    }
    @IBAction func action4(_ sender: Any) {
        artistSelected = myArtists.getArtist(genre: genreSelect!, position: 4)
        self.addtocoredata()

    }
    @IBAction func action5(_ sender: Any) {
        artistSelected = myArtists.getArtist(genre: genreSelect!, position: 5)
        self.addtocoredata()

    }
    @IBAction func action6(_ sender: Any) {
        artistSelected = myArtists.getArtist(genre: genreSelect!, position: 6)
        self.addtocoredata()

    }
    
    func addtocoredata(){
        let newMusic = Entity(context: self.context)
        newMusic.prevArtist = artistSelected
        newMusic.prevGenre = genreSelect
        do{
            try! self.context.save()
        }
        catch{
            
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navVC = segue.destination as! UINavigationController
        let vc = navVC.viewControllers.first as! navigationViewController
        vc.artistSelect = self.artistSelected
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
