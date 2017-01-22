//
//  DBManger.swift
//  iTunesTopChart
//
//  Created by NrmeenTomoum on 1/21/17.
//  Copyright © 2017 NrmeenTomoum. All rights reserved.
//

import UIKit
import CoreData


class DBManger {
    

  class  func insertData()
    {
         let tonesClassName:String = String(describing: Tones.self)
        print("----======>>>>>\(tonesClassName)")
         let tones:Tones = NSEntityDescription.insertNewObject(forEntityName: tonesClassName, into: DatabaseController.getContext()) as! Tones
        
        tones.title = "John"
        tones.link = "John"
        tones.image1 = "John"
        tones.image2 = "John"
        tones.image3 = "John"

        DatabaseController.saveContext()
   
    }
 class   func selectData()
    {
        
        let fetchRequest:NSFetchRequest<Tones> = Tones.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            print("number of results: \(searchResults.count)")
            
            for result in searchResults as [Tones]{
                print("..........\(result.title!) \(result.link!) ..........")
            }
        }
        catch{
            print("Error: \(error)")
        }

    }
    

}
