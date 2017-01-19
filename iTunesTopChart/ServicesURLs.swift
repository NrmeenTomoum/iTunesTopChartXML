//
//  ServicesURLs.swift
//  iTunesTopChart
//
//  Created by NrmeenTomoum on 1/16/17.
//  Copyright © 2017 NrmeenTomoum. All rights reserved.
//

import Foundation


class ServicesURLs: NSObject {
 
   // static  let BASEURL : String = "http://jeeran.gn4me.com/jeeran_v1"
    static func itunesURL() -> String{
        let  url = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=10/xml"
        return  url
}

}
