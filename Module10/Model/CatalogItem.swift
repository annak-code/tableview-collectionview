//
//  Catalog.swift
//  Module10
//
//

import Foundation
import MapKit

struct CatalogItem {
    let identifier: Int
    let name: String
    let imageName: String
    let price: Int
    let promoprice: Int
}

// MARK: - Support for loading data from plist
extension CatalogItem {
    static var defaultCatalog: [CatalogItem] = {
        return loadCatalogFromPlistNamed("catalog")
    }()
    
    static func loadCatalogFromPlistNamed(_ plistName: String) -> [CatalogItem] {
        guard
          let path = Bundle.main.path(forResource: plistName, ofType: "plist"),
          let dictArray = NSArray(contentsOfFile: path) as? [[String : AnyObject]]
          else {
            fatalError("An error occurred while reading \(plistName).plist")
        }
    
        var catalog: [CatalogItem] = []
        
        for dict in dictArray {
            guard
                let identifier    = dict["identifier"] as? Int,
                let name          = dict["name"]       as? String,
                let imageName     = dict["imageName"]  as? String,
                let price         = dict["price"]      as? Int,
                let promoprice    = dict["promoprice"] as? Int
                else {
                  fatalError("Error parsing dict \(dict)")
              }
            if promoprice >= price {
                fatalError("promoprice >= price \(dict)")
            }
            
            
            let catalogItem = CatalogItem (
                identifier: identifier,
                name: name,
                imageName: imageName,
                price: price,
                promoprice: promoprice
            )
            catalog.append(catalogItem)
        }
        return catalog
    }
}
