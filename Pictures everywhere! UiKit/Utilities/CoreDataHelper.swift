//
//  CoreDataHelper.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 06/10/2022.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func savePicture(data: Data, coordinates: LocationCoordinates) {
        let imageInstance = Picture(context: context)
        imageInstance.img = data
        imageInstance.longitude = coordinates.longitude
        imageInstance.latitude = coordinates.latitude
        imageInstance.date = Date().currentDateAsText
        
        do {
            try context.save()
            print("Image is saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchPictures() -> [Picture] {
        var fetchingImage = [Picture]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.coreDataEntity)
        
        do {
            fetchingImage = try context.fetch(fetchRequest) as! [Picture]
        } catch {
            print("Error while fetching the image")
        }
        return fetchingImage
    }
}
