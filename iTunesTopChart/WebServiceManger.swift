//
//  WebServiceManger.swift
//  iTunesTopChart
//
//  Created by NrmeenTomoum on 1/16/17.
//  Copyright © 2017 NrmeenTomoum. All rights reserved.
//

import Foundation
import AlamofireImage
import AlamofireXmlToObjects
import Alamofire
import SwiftyXMLParser
class WebserviceManager
{
    static func getImage(_ url : String,result: @escaping (_ image :UIImage,_ code:String?)->Void)
    {
        Alamofire.request(url)
            .responseImage { response in
                switch response.result
                {
                case .success:
                    //   print(response.request)
                    if let image = response.result.value {
                        //    print("image downloaded: \(image)")
                        result(image,"error")
                    }
                    break;
                case .failure(let _error):
                    // result(image:image,code: "error")
                    print("ErEEEror")
                    break;
                }
        }
        
    }
    
  static  func gettitles(resultr: @escaping (_ titles :[String],_ code:String?)->Void) {
    
    var titlesIn = [String] ()
        Alamofire.request(ServicesURLs.itunesURL())
            .responseObject { (response: DataResponse<Feed>) in
                if let result = response.result.value {
                     for i in 0..<result.entry.count
                    {
                        titlesIn.append(result.entry[i].title!)
                        }
                      resultr(titlesIn,"error")
               }
        }
    }
   static func getImages(resultr: @escaping (_ images :[String],_ code:String?)->Void) {
    var imagesIn = [String] ()
        Alamofire.request(ServicesURLs.itunesURL())
            .responseData { response in
                if let data = response.data {
                    let xml = XML.parse(data)
                    for element in xml["feed", "entry"] {
                        
                        for element2 in element["im:image"] {
                             imagesIn.append(element2.text!)
                        }
                        
                    }
                           resultr(imagesIn,"error")
                }
        }
        
    }
    
  static  func getLinks(resultr: @escaping (_ images :[String],_ code:String?)->Void) {
    var linksIn = [String] ()
        Alamofire.request(ServicesURLs.itunesURL())
            .responseData { response in
                if let data = response.data {
                    let xml = XML.parse(data)
                    for element in xml["feed", "entry"] {
                        
                        for element2 in element["id"]{
                             linksIn.append(element2.text!)
                            }
                    }
                      resultr(linksIn,"error")
                }
        }
        
    }
    
    
}
