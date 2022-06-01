//
//  HomeVC.swift
//  VWNTask
//
//  Created by Amirkhouzam on 29/04/2022.
//

import UIKit
import CoreData

class HomeVC: UIViewController {
    
    var productmodel : [Product]?
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    //MARK: - Outlets
    
    @IBOutlet weak var icedcoffebtn: UIButton!
    @IBOutlet weak var hotdrinksbtn: UIButton!
    @IBOutlet weak var platesbtn: UIButton!
    @IBOutlet weak var allbtn: UIButton!
    @IBOutlet weak var searchfieldbar: UISearchBar!
    @IBOutlet weak var Desertsbtn: UIButton!
    @IBOutlet weak var Dinnerbtn: UIButton!
    @IBOutlet weak var Breakfastbtn: UIButton!
    @IBOutlet weak var ProductCollec: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Breakfastbtn.layer.cornerRadius = 20
        Dinnerbtn.layer.cornerRadius = 20
        Desertsbtn.layer.cornerRadius = 20
        ProductCollec.delegate = self
        ProductCollec.dataSource = self
        ProductCollec.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        searchfieldbar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchfieldbar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        searchfieldbar.placeholder = "Search"
        coredatacaller.shared.getdataoffline(self: self) { product in
            
            self.productmodel = product
        }
        
        
    }
    //MARK: - IBActions
    
    @IBAction func Breakfastbtnaction(_ sender: UIButton) {
        Breakfastbtn.backgroundColor = .systemPink
        Breakfastbtn.tintColor = .white
        Dinnerbtn.backgroundColor = .white
        Dinnerbtn.tintColor = .black
        Desertsbtn.backgroundColor = .white
        Desertsbtn.tintColor = .black
    }
    @IBAction func dinnerbtnaction(_ sender: UIButton) {
        Breakfastbtn.backgroundColor = .white
        Breakfastbtn.tintColor = .black
        Dinnerbtn.backgroundColor = .systemPink
        Dinnerbtn.tintColor = .white
        Desertsbtn.backgroundColor = .white
        Desertsbtn.tintColor = .black
    }
    @IBAction func desertsbtnaction(_ sender: UIButton) {
        Breakfastbtn.backgroundColor = .white
        Breakfastbtn.tintColor = .black
        Dinnerbtn.backgroundColor = .white
        Dinnerbtn.tintColor = .black
        Desertsbtn.backgroundColor = .systemPink
        Desertsbtn.tintColor = .white
    }
    @IBAction func allbtnpressed(_ sender: UIButton) {
        allbtn.tintColor = .black
        platesbtn.tintColor = .lightGray
        hotdrinksbtn.tintColor = .lightGray
        icedcoffebtn.tintColor = .lightGray
    }
    @IBAction func platesbtpressed(_ sender: UIButton) {
        allbtn.tintColor = .lightGray
        platesbtn.tintColor = .black
        hotdrinksbtn.tintColor = .lightGray
        icedcoffebtn.tintColor = .lightGray
    }
    @IBAction func hotdrinksbtnpressed(_ sender: UIButton) {
        allbtn.tintColor = .lightGray
        platesbtn.tintColor = .lightGray
        hotdrinksbtn.tintColor = .black
        icedcoffebtn.tintColor = .lightGray
    }
    @IBAction func icedcoofeebtnpressed(_ sender: UIButton) {
        allbtn.tintColor = .lightGray
        platesbtn.tintColor = .lightGray
        hotdrinksbtn.tintColor = .lightGray
        icedcoffebtn.tintColor = .black
    }
    
    

}
//MARK: - Extensions

// collectionview delegate and datasource
extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productmodel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else {return UICollectionViewCell()}
        
        guard let data = productmodel else {return UICollectionViewCell()}
        cell.productname.text = data[indexPath.row].product_name
        cell.Productprice.text = "\(data[indexPath.row].price)"
        cell.productimage.image = filemanager.shared.readimage(path: data[indexPath.row].product_name ?? "test")
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width / 2 - 30, height: height / 4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
