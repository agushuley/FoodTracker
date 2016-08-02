//
//  ViewController.swift
//  Food Tracker
//
//  Created by Andriy Gushuley on 22/07/15.
//  Copyright © 2015 gushuley os. All rights reserved.
//

import UIKit

class MealViewController:
    UIViewController,
    UITextFieldDelegate,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    // MARK: Properties
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var ratingControl: RatingControl!
    
    var meal: Meal? = nil
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.hideKeyboard()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        navigationItem.title = nameField.text
        
        updateSaveStatusToText()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
        
        updateSaveStatusToText()
    }
    
    // MARK: UIImagePickerControllerDelegate, UINavigationControllerDelegate

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // Dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]
    ) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // Set photoImageView to display the selected image.
            photoView.image = selectedImage
            
            // Dismiss the picker.
            dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: Actions
    
    @IBAction func selectImageFromLibraryAction(_ sender: UITapGestureRecognizer) {
        self.hideKeyboard()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        
        if let meal = meal {
            navigationItem.title = meal.name
            nameField.text = meal.name
            photoView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        updateSaveStatusToText()
    }

    // MARK: Custom methods
    
    func hideKeyboard() {
        nameField.resignFirstResponder()
    }
    
    private func updateSaveStatusToText() {
        saveButton.isEnabled = !(nameField.text ?? "").isEmpty
    }
    // MARK: Navigation
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender === saveButton {
            let name = nameField.text ?? ""
            let photo = photoView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo!, rating: rating)
        }
    }
}

