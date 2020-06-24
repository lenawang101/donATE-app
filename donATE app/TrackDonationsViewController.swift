//
//  TrackDonationsViewController.swift
//  donATE app
//
//  Created by Lena Wang on 6/24/20.
//  Copyright © 2020 Lena Wang. All rights reserved.
//

import UIKit



    
    
    
  
class TrackDonationsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var imagePicker = UIImagePickerController()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            imagePicker.delegate = self
        }

    @IBAction func takePictureTapped(_ sender: Any) {
        
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
   
        
    @IBAction func chooseFromLib(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    

    @IBOutlet weak var displayImage: UIImageView!
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                displayImage.image = selectedImage
            }
            imagePicker.dismiss(animated: true, completion: nil)
        }
        
    



        // Do any additional setup after loading the view
            
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

