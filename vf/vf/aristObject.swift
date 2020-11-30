//
//  aristObject.swift
//  vf
//
//  Created by Moses Kang on 11/29/20.
//

import Foundation

class artistObject{
    var artistDic: [String:[String]] = [String:[String]]()
    
    init(){
        artistDic["hip-hop"] = ["DaBaby", "21 Savage", "Megan Thee Stallion", "Drake", "Kanye West", "Travis Scott", "Cardi B"]
        artistDic["country"] = ["Keith Urban", "Miranda Lambert", "Rascal Flatts", "Lady Antebellum", "Lee Brice", "The Wreckers", "Carrie Underwood"]
        artistDic["popular"] = ["Ariana Grande", "Bruno Mars", "Justin Bieber", "Doja Cat", "Jason Derulo", "Harry Styles", "Pink Sweat$"]
        artistDic["rnb"] = ["Usher", "H.E.R.", "Frank Ocean", "Trey Songz", "The Weeknd", "Khalid", "Beyoncé"]
        artistDic["alternative"] = ["lovelytheband", "Nirvana", "Foo Fighters", "Weezer", "Green Day", "Beck", "R.E.M."]
        artistDic["latin"] = ["Daddy Yankee", "Shakira", "Becky G", "Maluma", "Enrique Iglesias", "Luis Fonsi", "Nicky Jam",]
        artistDic["kpop"] = ["BTS", "BLACKPINK", "Red Velvet", "EXO", "BIGBANG", "Zion.T", "ZICO"]
    }
    
    func getCount() -> Int {
        return artistDic.count
    }
    
    func getArtist(genre: String, position: Int) -> String{
        let temp:[String]? = artistDic[genre]
        let ret:String? = temp![position]
        return ret!
    }
}
