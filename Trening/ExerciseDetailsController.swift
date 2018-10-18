//
//  ViewController.swift
//  Trening
//
//  Created by Damian Skowroński on 16/10/2018.
//  Copyright © 2018 Damian Skowroński. All rights reserved.
//

import UIKit
import os.log //unified logging system

class ExerciseDetailsController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var exercise: Exercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field’s user input through delegate callbacks.
        titleField.delegate = self

    }
    
    //MARK: Navigation
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        //  This code verifies that the sender is a button, and then uses the identity operator
        //(===) to check that the objects referenced by the sender and the saveButton outlet are the same.
        let title = titleField.text ?? "test"
//        Notice the nil coalescing operator (??) in the name line.
//        The nil coalescing operator is used to return the value of an optional if the optional has a value, or return a default value otherwise
//        let description = descriptionView.text ?? ""
        let description = "test"
        
        exercise = Exercise(title: title, description: description)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
