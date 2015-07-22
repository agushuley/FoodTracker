//
//  ViewController.swift
//  Food Tracker
//
//  Created by Andriy Gushuley on 22/07/15.
//  Copyright © 2015 gushuley os. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!

    // MARK: Actions
    @IBAction func setDefaultLabelAction(sender: UIButton) {
        nameLabel.text = "Default Text"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        nameLabel.text = nameField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
    }

}

