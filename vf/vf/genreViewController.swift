//
//  genreViewController.swift
//  vf
//
//  Created by Moses Kang on 11/29/20.
//

import UIKit

class genreViewController: UIViewController {

    var genreSelected:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func popular(_ sender: Any) {
        genreSelected = "latin"
        print(genreSelected)
    }
    @IBAction func latin(_ sender: Any) {
        genreSelected = "popular"
        print("giga\(genreSelected)")
    }
    @IBAction func country(_ sender: Any) {
        genreSelected = "country"
        print(genreSelected)
    }
    @IBAction func rnb(_ sender: Any) {
        genreSelected = "rnb"
        print(genreSelected)
    }
    @IBAction func alternative(_ sender: Any) {
        genreSelected = "alternative"
        print(genreSelected)
    }
    @IBAction func hiphop(_ sender: Any) {
        genreSelected = "hip-hop"
        print(genreSelected)
    }
    @IBAction func kpop(_ sender: Any) {
        genreSelected = "kpop"
        print(genreSelected)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController: artistViewController = segue.destination as? artistViewController{
            viewController.genreSelect = self.genreSelected
            print(self.genreSelected)
            //print(viewController.genreSelect)
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
