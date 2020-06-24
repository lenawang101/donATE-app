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
        
    
    @IBOutlet weak var insertMessage: UILabel!
    
    
 
    @IBOutlet weak var orgTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    
    @IBAction func recordDonationButtonTapped(_ sender: Any) {
        
        if orgTextField.text != "" || dateTextField.text != "" || amountTextField.text != ""{
            
        
        insertMessage.text = "Thank you for your contribution!"
            
            
        }
        
        else{
            insertMessage.text = "Please fill out all required fields."
        }
    }
 
    //    @IBOutlet weak var insertFact: UILabel!
//       @IBAction func buttonPushed(_ sender: UIButton) {
//           let facts = ["I have a sister 14 years older than me!","I have broken a bone every year of high school!","I love science!","I live in Maryland.","I can speak Mandarin Chinese.","I love Avatar the Last Airbender!"]
//           let number = Int.random(in:0...5)
//           let chosenFact = facts[number]
//           insertFact.text = chosenFact
//       }



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


