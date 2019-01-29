//
//  PostParser.swift
//  HelloRest
//
//  Created by mobapp06 on 29/01/2019.
//  Copyright © 2019 EhB. All rights reserved.
//

import Foundation

class PostParser{
    
    static func getAllPosts() -> [UserPost]{
        //op welk adres staat de data?
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts")!
        //starten lege array
        var posts = [UserPost]()
        //indien iets faalt zoals geen verbinding, verkeerde data, ....
        do{
            //ruwe data van url binnenhalen
            let data = try Data.init(contentsOf: url)
            //voorlopig test, komt er iets binnen
            print(data)
            //data start met een array, data laten omzetten naar array van objecten
            let jsonArray = try JSONSerialization.jsonObject(with: data) as! [NSObject]
            
            //array overlopen loop
            for item in jsonArray {
                //value for key, geeft een generiek object terug, moeten we nog casten
                let id = item.value(forKey: "id") as! Int
                let userId = item.value(forKey: "userId") as!Int
                let title = item.value(forKey: "title") as! String
                let body = item.value(forKey: "body") as! String
                
                let currentPost = UserPost.init(id: id, userId: userId, title: title, body: body)
                
                posts.append(currentPost)
            }
        }catch{
            print("\'t werkt ni")
        }
        return posts
    }

}

