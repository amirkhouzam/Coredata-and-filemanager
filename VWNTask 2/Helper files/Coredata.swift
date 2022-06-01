//
//  Coredata.swift
//  VWNTask
//
//  Created by Amirkhouzam on 01/05/2022.
//


import CoreData
import UIKit

class coredatacaller {
    
    static let shared = coredatacaller()
    func insertdata(Productname : String? , Productinfo : String? , meal : String? , itemtype : String? , price : Int16){
        

        guard let object = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context) as? Product else {return}
        
        object.product_name = Productname
        object.product_info = Productinfo
        object.item_type = itemtype
        object.meal = meal
        object.price = price
        
        context.insert(object)
        do{
            try context.save()
        }catch{
            return
        }
        
        
    }
    


    func getdataoffline(self : UIViewController , completion :@escaping([Product]?) -> Void){

        let predict : NSFetchRequest = Product.fetchRequest()

        do{
            let result = try context.fetch(predict)
            completion(result)

        }catch{
            completion(nil)
            let alert = UIAlertController(title: "Error Getting Data", message: "Cannot getting data", preferredStyle: .alert)
            let alertaction = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
            alert.addAction(alertaction)
            self.present(alert, animated: true, completion: nil)
        }

    }
    
}

