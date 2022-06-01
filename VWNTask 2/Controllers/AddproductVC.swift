//
//  AddproductVC.swift
//  VWNTask
//
//  Created by Amirkhouzam on 29/04/2022.
//

import UIKit

class AddproductVC: UIViewController {

    @IBOutlet weak var leftconstraitforaddbtn: NSLayoutConstraint!
    @IBOutlet weak var addimagebtnoutlets: UIButton!
    @IBOutlet weak var Productnamefield: UITextField!
    @IBOutlet weak var Productinfofield: UITextField!
    @IBOutlet weak var Mealfield: UITextField!
    @IBOutlet weak var itemtypefield: UITextField!
    @IBOutlet weak var Pricefield: UITextField!
    @IBOutlet weak var Donebtnoutlets: UIButton!
    let upbtn : UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "Group 13"), for: .normal)
        return btn
    }()
    let downbtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Path 3"), for: .normal)
        return btn
    }()
    let imageview : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    let btn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "remove"), for: .normal)
        btn.addTarget(self, action: #selector(removeimage), for: .touchUpInside)
        return btn
    }()
    @objc func removeimage(){
        imageview.isHidden = true
        leftconstraitforaddbtn.constant = 20
        addimagebtnoutlets.isEnabled = true
        btn.isHidden = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addimagebtnoutlets.layer.cornerRadius = 20
        addimagebtnoutlets.layer.shadowColor = UIColor.lightGray.cgColor
        addimagebtnoutlets.layer.shadowOpacity = 1
        addimagebtnoutlets.layer.shadowRadius = 10
        Productnamefield.layer.masksToBounds = true
        Productnamefield.layer.cornerRadius = 20
        Productinfofield.layer.masksToBounds = true
        Productinfofield.layer.cornerRadius = 20
        Mealfield.layer.masksToBounds = true
        Mealfield.layer.cornerRadius = 20
        itemtypefield.layer.masksToBounds = true
        itemtypefield.layer.cornerRadius = 20
        Pricefield.layer.masksToBounds = true
        Pricefield.layer.cornerRadius = 20
        Donebtnoutlets.layer.cornerRadius = 20
        Donebtnoutlets.layer.shadowColor = UIColor.lightGray.cgColor
        Donebtnoutlets.layer.shadowOpacity = 1
        Donebtnoutlets.layer.shadowRadius = 10
        Pricefield.keyboardType = .numberPad
    }
    
//    @IBAction func backbtnpressed(_ sender: UIButton) {
//
//        dismiss(animated: true, completion: nil)
//    }
    @IBAction func addimagebtnpressed(_ sender: UIButton) {
        photoaccessactionsheet()
    }
    @IBAction func donebtnpressed(_ sender: UIButton) {
        if let name = Productnamefield.text , let info = Productinfofield.text , let price = Pricefield.text , let meal = Mealfield.text , let itemtype = itemtypefield.text , let img = imageview.image{
            coredatacaller.shared.insertdata(Productname: name, Productinfo: info, meal: meal, itemtype: itemtype, price: Int16(price) ?? 0)
            filemanager.shared.saveJpg(img, pathstring: Productnamefield.text ?? "test")
                
            
        }
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    

    
}
extension AddproductVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    func photoaccessactionsheet(){
        let actionsheet = UIAlertController(title: "Profile Photo", message: nil, preferredStyle: .actionSheet)
        
        actionsheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            
            self.presentlibrary()
            
        }))
        
        
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionsheet, animated: true, completion: nil)
    }
    
    func presentlibrary(){
        let imagepicker = UIImagePickerController()
        imagepicker.sourceType = .photoLibrary
        imagepicker.allowsEditing = true
        imagepicker.delegate = self
        present(imagepicker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let Selectedimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        imageview.image = Selectedimage
        imageview.frame = CGRect(x: 20, y: addimagebtnoutlets.top, width: 70, height: 70)
        btn.frame = CGRect(x: imageview.right - 10, y: imageview.top - 10, width: 20, height: 20)
        leftconstraitforaddbtn.constant = 100
        addimagebtnoutlets.isEnabled = false
        btn.isHidden = false
        imageview.isHidden = false
        self.view.addSubview(imageview)
        self.view.addSubview(btn)
        self.dismiss(animated: true, completion: nil)
    }
}
