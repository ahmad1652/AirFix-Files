//
//  photoDetectedViewController.swift
//  AirFix
//
//  Created by Ahmad Mustafa on 5/23/19.
//  Copyright © 2019 Pixel. All rights reserved.
//

import UIKit
import Vision
import CoreML

class photoDetectedViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageUsrPicker: UIImageView!
    
    @IBOutlet weak var finalRouterResult: UILabel!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let usrPickingImage = info[.originalImage] as? UIImage{
            guard let convertCIImage = CIImage(image: usrPickingImage) else {return}
            
            imageUsrPicker.image = usrPickingImage
            
            scanRouter(image : convertCIImage)
        }
        
        
    }
    
    func scanRouter(image : CIImage){
        guard let model = try? VNCoreMLModel(for: RouterML().model) else {return}
        
        // scan the request inside the closure
        let request = VNCoreMLRequest(model: model){ request, error in
            
            // set the reuslt and most result
            guard let result = request.results as? [VNClassificationObservation] else {return}
            guard let mostResult = result.first else {return}
            
            DispatchQueue.main.async {
                if mostResult.confidence >= 0.9{
                    switch mostResult.identifier{
                    case "NoElectric":
                        self.finalRouterResult.text = "there is no power .. conect it to the power"
                    case "NoInternet":
                        self.finalRouterResult.text = " there is no internet connection"
                    case "work":
                        self.finalRouterResult.text = " everything is fine"
                        
                    default:
                        return
                    }
                }else{
                    self.finalRouterResult.text = "there is no router"
                }
            }
        }
        let requestHander = VNImageRequestHandler(ciImage: image, options: [:])
        do{
            try requestHander.perform([request])
        }catch{
            print(error)
        }
    }
    
    
    @IBAction func btnTapped(_ sender: UIButton) {
        imagePicker.delegate = self
        
        let alert = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker,animated: true,completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Libary", style: .default, handler: { (action) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker,animated: true,completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert,animated: true,completion: nil)
    }
    

}
