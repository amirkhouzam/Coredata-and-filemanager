//
//  ViewController.swift
//  VWNTask
//
//  Created by Amirkhouzam on 29/04/2022.
//

import UIKit
import CoreData

class BaseVC: UIViewController {

    //MARK: - Outlets
//    @IBOutlet weak var Signupbtnoutlet: UIButton!
    @IBOutlet weak var btnsview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnsview.layer.cornerRadius = 20
        
    
    }
    
    //MARK: - IBACTIONS
    
//    @IBAction func Signupbtn(_ sender: UIButton) {
//    }
    @IBAction func Signinbtn(_ sender: UIButton) {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddproductVC") as? AddproductVC else {return}
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

