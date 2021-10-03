//
//  Task1ViewController.swift
//  Module10
//
//

import UIKit

class Task1ViewController: UIViewController {
    var catalog: [CatalogItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catalog = CatalogItem.defaultCatalog
        
    }
}

extension Task1ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.size.width / 2 - 15
        return CGSize(width: w, height: w * 1.9)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalog.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCollectionViewCell
        let item = catalog[indexPath.row]
        cell.nameLabel.text = item.name
        cell.promopriceLabel.text = "\(item.promoprice) RUB"
        
        //зачеркнуть текст начало
        let text = "\(item.price) RUB"
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        cell.priceLabel.attributedText = attributeString
        
        //заокруглить края
        cell.discountLabel.text = "-\(100 - item.promoprice * 100 / item.price)%"
        cell.discountLabel.layer.masksToBounds = true
        cell.discountLabel.layer.cornerRadius = 5
        
        cell.imageView.image = UIImage(named: item.imageName)
        
        return cell
    }
    


}
