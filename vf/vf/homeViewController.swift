//
//  homeViewController.swift
//  vf
//
//  Created by Moses Kang on 11/29/20.
//

import UIKit

class homeViewController: UIViewController {

    @IBOutlet weak var prevMessage: UILabel!
    @IBOutlet weak var prevGenre: UILabel!
    @IBOutlet weak var oldSearch: UIButton!
    @IBOutlet weak var prevArtist: UILabel!
    var items:[Entity]?
    var artistSelected:String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        //items![0].prevArtist
        print(items!.count)
        
        if items!.count == 0 {
            prevGenre.text = ""
            prevArtist.text = ""
            prevMessage.text = "Please press search to begin a new search"
            oldSearch.isHidden = true
        }
        else {
            //prevGenre.text = items![0].prevArtist
            prevArtist.text = items![items!.count - 1].prevArtist
            prevGenre.text = items![items!.count - 1].prevGenre
            self.artistSelected = items![items!.count - 1].prevArtist
            
            //quality of app.(making sure app memory doesnt go crazy)
            let removeable = items![0]
            self.context.delete(removeable)
            do{
                try! self.context.save()
            }
            catch{}
            print(items!.count)
        }
    
        // Do any additional setup after loading the view.
    }
    
    func fetchData(){
        
        do{
            self.items = try context.fetch(Entity.fetchRequest())
            
        }
        catch{
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "oldTrack"{
            let navVC = segue.destination as! UINavigationController
            let vc = navVC.viewControllers.first as! navigationViewController
            vc.artistSelect = self.artistSelected
        }
        else if segue.identifier == "newTrack"{
            if let viewController: artistViewController = segue.destination as? artistViewController{
                //viewController.genreSelect = self.genreSelected
                print(self.artistSelected)
                //print(viewController.genreSelect)
            }
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
