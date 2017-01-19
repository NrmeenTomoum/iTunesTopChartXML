//
//  TableView.swift
//  iTunesTopChart
//
//  Created by NrmeenTomoum on 1/16/17.
//  Copyright © 2017 NrmeenTomoum. All rights reserved.
//

import Foundation
import UIKit
import ReachabilitySwift
import PhotoSlider

class TableView: UITableViewController {
    
  var titles = [String]()
 var images = [String]()
    @IBOutlet var table: UITableView!
   override func viewDidLoad() {
    
    
    if NetWorkAvailability.isInternetAvailable()
    {
      WebserviceManager.gettitles { (titlesOut: [String],code: String?) in
        self.titles = titlesOut
        print("=====>>> %d",self.titles.count)
  
    self.table.reloadData()
    }
    WebserviceManager.getImages { (imagesOut: [String],code: String?) in
         self.images = imagesOut
         self.table.reloadData()
    }
    }
    else
    {
    print("=======================================================================================")
    
    }
     super.viewDidLoad()
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(titles.count)
       return titles.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
      let title = titles[indexPath.row]
     //   cell.imageITunes=
    print("fffffffff")
         print("  =====> %s",title)
       cell.label?.text = title
       print("  =====> %s",images[indexPath.row])
    var index = indexPath.row
    if indexPath.row == 0
    {
    }
    else
    {
    index*=3
    }
    if let url  = NSURL(string: self.images[index]),
        let data = NSData(contentsOf: url as URL)
    {
         cell.imageITunes.image = UIImage(data: data as Data)
    }
        
//    WebserviceManager.getImage( ("http://www.apple.com/euro/ios/ios8/a/generic/images/og.png") , result: { (image, code) in
//        cell.imageITunes.image = image
//    })
    
//    
//    if let url = URL(string: images[indexPath.row]) {
//        print("=======>",url)
//        let request = URLRequest(url: url)
//    NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {
//        (response: URLResponse?, data: Data?, error: Error?) -> Void in
//       cell.imageITunes.image = UIImage(data: data!)
//    }
//    }
    
    
    return cell
    
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var imagesURLS = [URL] ()
        
        imagesURLS.append(URL(string: self.images[indexPath.row] )!)
        imagesURLS.append(URL(string: self.images[indexPath.row+1] )!)
        imagesURLS.append(URL(string: self.images[indexPath.row+2] )!)
        var slider = PhotoSlider.ViewController(imageURLs: imagesURLS)
        slider.modalPresentationStyle = .overCurrentContext
        slider.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        slider.index (ofAccessibilityElement: indexPath.row)
        self.present(slider, animated: true, completion: nil)
    }
 
    
}
