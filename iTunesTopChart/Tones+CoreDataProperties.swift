//
//  Tones+CoreDataProperties.swift
//  iTunesTopChart
//
//  Created by NrmeenTomoum on 1/21/17.
//  Copyright © 2017 NrmeenTomoum. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Tones {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tones> {
        return NSFetchRequest<Tones>(entityName: "Tones");
    }

    @NSManaged public var image1: String?
    @NSManaged public var image2: String?
    @NSManaged public var image3: String?
    @NSManaged public var link: String?
    @NSManaged public var title: String?

}
