//
//  TableView.swift
//  iTunesTopChart
//
//  Created by NrmeenTomoum on 1/16/17.
//  Copyright © 2017 NrmeenTomoum. All rights reserved.


import Foundation
import UIKit
import ReachabilitySwift
import PhotoSlider

class TableView: UITableViewController {
    
 // @IBOutlet var indectorLoading: UIActivityIndicatorView!
    
    @IBOutlet weak var indector: UIActivityIndicatorView!
    var titles = [String]()
    var images = [String]()
  var links = [String]()
    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
    // DBManger.insertData()
     //   DBManger.selectData()
        if NetWorkAvailability.isInternetAvailable()
        {
            reloadAllData()
        }
        else
        {
            print("============= cashing ============")
        }
        super.viewDidLoad()
    }
    
    
    func reloadAllData(){
      //  view.addSubview(indectorLoading)
       indector.startAnimating()
        WebserviceManager.gettitles { (titlesOut: [String],code: String?) in
            self.titles = titlesOut
            self.table.reloadData()
        }
        WebserviceManager.getImages { (imagesOut: [String],code: String?) in
            self.images = imagesOut
            self.table.reloadData()
        }
        WebserviceManager.getLinks { (linksOut:[String],code: String?) in
            self.links = linksOut
        }
        indector.stopAnimating()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(titles.count)
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if titles.count == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
            cell.label?.text = "No Tones found "
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let title = titles[indexPath.row]
        cell.label?.text = title
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
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var imagesURLS = [URL] ()
        if indexPath.row == 0
        {
            imagesURLS.append(URL(string: self.images[indexPath.row+2] )!)
            imagesURLS.append(URL(string: self.images[indexPath.row] )!)
            imagesURLS.append(URL(string: self.images[indexPath.row+1] )!)
        }
        else  {
            
            imagesURLS.append(URL(string: self.images[indexPath.row*3+2] )!)
            imagesURLS.append(URL(string: self.images[indexPath.row*3] )!)
            imagesURLS.append(URL(string: self.images[indexPath.row*3+1] )!)
        }
        print( "=====",links[indexPath.row] )
        var slider = PhotoSlider.ViewController(imageURLs: imagesURLS,urlLink : links[indexPath.row])
        slider.modalPresentationStyle = .overCurrentContext
        slider.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        slider.index (ofAccessibilityElement: indexPath.row)
        self.present(slider, animated: true, completion: nil)
    }
    
    
}
