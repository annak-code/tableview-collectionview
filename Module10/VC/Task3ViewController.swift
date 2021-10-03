//
//  Task3ViewController.swift
//  Module10
//
//

import UIKit
import MapKit

class Task3ViewController: UIViewController {
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    
    @IBOutlet weak var infoView: UIView!
    
    @IBOutlet var backgroundColoredLabels: [UILabel]!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var conditionsLabel: UILabel!
    
    @IBOutlet weak var discountImageView: UIImageView!
    @IBOutlet weak var yourDiscountLabel: UILabel!
    @IBOutlet weak var discountAmountLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var Menu: UIButton!
    @IBOutlet weak var CreateEvent: UIButton!
    @IBOutlet weak var OrderToGo: UIButton!
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    
    var burgerImgArr = [UIImage(named: "Burger1"),
                        UIImage(named: "Burger2"),
                        UIImage(named: "Burger3"),
                        UIImage(named: "Burger4"),
                        UIImage(named: "BurgerRestaurant")]
    
    var location = CLLocationCoordinate2D(latitude: 55.76840771154556, longitude: 37.61484878486768)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.numberOfPages = burgerImgArr.count
        pageView.currentPage = 0

        //заокруглить 2 верхних угла
        infoView.layer.cornerRadius = 20
        infoView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        //дизайн лейблов и кнопок
        for label in backgroundColoredLabels {
          label.backgroundColor = .clear
        }
        
        for button in buttons {
            button.layer.cornerRadius = 10
            button.backgroundColor = .clear
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.systemGreen.cgColor
            button.setTitleColor(.systemGreen, for: .normal)
        }
        CreateEvent.setTitleColor(.systemBackground, for: .normal)
        CreateEvent.backgroundColor = .systemGreen
        
        getTexts()
        
        //MKMapView
        mapView.setCenter(location, animated: true)
        
        let zoomRegion = MKCoordinateRegion.init(center: location, latitudinalMeters: 1500, longitudinalMeters: 1500)
        mapView.setRegion(zoomRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Петровский бульв., 9"
        mapView.addAnnotation(annotation)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //изменить пейдж при листании карусели
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageView.currentPage = Int(x / view.frame.width)
    }
    
    //задать имена для леблов и кнопок
    func getTexts() {
        nameLabel.text = "Бургерная Джо"
        typeLabel.text = "Американская кухня"
        descriptionLabel.text = "Что нужно для того, чтобы приготовить самые вкусные бургеры? Сперва, это качественные ингридиенты."
        conditionsLabel.text = "Депозит составляет 100 рублей. При отмене брони менее чем за 2 часа, депозит удерживается"
        Menu.setTitle("МЕНЮ", for: .normal)
        CreateEvent.setTitle("СОЗДАТЬ СОБЫТИЕ", for: .normal)
        OrderToGo.setTitle("ЗАКАЗАТЬ НА ВЫНОС", for: .normal)
        discountImageView.image = UIImage(systemName: "creditcard")
        yourDiscountLabel.text = "Ваша скидка"
        discountAmountLabel.text = "20%"
        rateLabel.text = "5.0"
        
    }
    
    
}

extension Task3ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return burgerImgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = burgerImgArr[indexPath.row]
//            pageView.currentPage = indexPath.row
        }
        return cell
    }
    
}

extension Task3ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
