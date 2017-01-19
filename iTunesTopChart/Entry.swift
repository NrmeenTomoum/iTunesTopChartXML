//
//  File.swift
//  iTunesTopChart
//
//  Created by NrmeenTomoum on 1/16/17.
//  Copyright © 2017 NrmeenTomoum. All rights reserved.
//

import Foundation
import AlamofireXmlToObjects
import EVReflection 
class Feed: EVObject {
    var entry: [Entry] = [Entry]()
}

class Entry: EVObject {
    var title: String?
    var updated: String?
}
