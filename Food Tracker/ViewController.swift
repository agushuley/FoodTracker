//
//  ViewController.swift
//  Food Tracker
//
//  Created by Andriy Gushuley on 22/07/15.
//  Copyright © 2015 gushuley os. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UITextFieldDelegate,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    // MARK: Properties
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var starsSelector: RatingControl!

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.hideKeyboard()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        nameLabel.text = nameField.text
    }
    
    // MARK: UIImagePickerControllerDelegate, UINavigationControllerDelegate

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
            // Dismiss the picker if the user canceled
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]
    ) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // Set photoImageView to display the selected image.
            photoView.image = selectedImage
            
            // Dismiss the picker.
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    // MARK: Actions
    
    @IBAction func selectImageFromLibraryAction(sender: UITapGestureRecognizer) {
        self.hideKeyboard()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
    }

    // MARK: Custom methods
    
    func hideKeyboard() {
        nameField.resignFirstResponder()
    }
}

