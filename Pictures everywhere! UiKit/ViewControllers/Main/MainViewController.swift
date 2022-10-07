//
//  ViewController.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 06/10/2022.
//

import UIKit
import CoreLocation
import MapKit

protocol MainViewControllerPresenterProtocol {
    func reloadPictures()
    func savePicture(data: Data, coordinates: LocationCoordinates)
}

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, MainViewControllerProtocol {
    private var viewData = MainViewControllerData()
    private var presenter: MainViewControllerPresenterProtocol
        
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    init(presenter: MainViewControllerPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: MainViewController.identifier, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MainView_title".localized()
        
        addButton.setTitle("MainView_add_button".localized(), for: .normal)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: MainImageCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MainImageCollectionViewCell.identifier)
        
        presenter.reloadPictures()
        
        viewData.locationManager.delegate = self
        viewData.locationManager.requestWhenInUseAuthorization()
        viewData.locationManager.requestLocation()
    }
    
    @IBAction func addImageAction(_ sender: UIButton) {
        viewData.locationManager.requestLocation()
        
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        vc.modalPresentationStyle = .popover
        present(vc, animated: true)
    }
    
    // MARK: - MainViewControllerProtocol
    
    func loadPictures(pictures: [Picture]) {
        viewData = MainViewControllerData(pictures: pictures, updatedCoordinates: viewData.updatedCoordinates, locationManager: viewData.locationManager)
        collectionView.reloadData()
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        if let imageData = image.pngData() {
            presenter.savePicture(data: imageData, coordinates: viewData.updatedCoordinates)
            presenter.reloadPictures()
        }
        
        picker.dismiss(animated: true)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData.pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainImageCollectionViewCell.identifier, for: indexPath) as! MainImageCollectionViewCell
        cell.populate(picture: viewData.pictures[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tabBar = DetailUITabBarController(picture: viewData.pictures[indexPath.row])
        navigationController?.pushViewController(tabBar, animated: true)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / Constants.MainViewController.collectionColumns, height: collectionView.bounds.width / Constants.MainViewController.collectionColumns)
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude as Double
            let longitude = location.coordinate.longitude as Double
            viewData.updatedCoordinates = LocationCoordinates(latitude: latitude, longitude: longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

