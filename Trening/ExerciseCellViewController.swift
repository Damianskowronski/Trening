//
//  ExerciseCellViewController.swift
//  Trening
//
//  Created by Damian Skowroński on 04.10.2018.
//  Copyright © 2018 Damian Skowroński. All rights reserved.
//

import UIKit

class ExerciseCellViewController: UITableViewCell {

    @IBOutlet weak var exerciseName: UILabel!
    
    func setExercise(exercise: Exercise) {
        exerciseName.text = exercise.title
    }
    
}

