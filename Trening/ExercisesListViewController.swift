//
//  exercisesListViewController.swift
//  Trening
//
//  Created by Damian Skowroński on 04.10.2018.
//  Copyright © 2018 Damian Skowroński. All rights reserved.
//

import UIKit

class ExercisesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    
    private var exercises = [Exercise]()
    private var selectedExercises = [Exercise]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
        
        exercises = createExerciseArray()
        selectedExercises = exercises
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: Create array func
    private func createExerciseArray() -> [Exercise] {
        
        let exercise1 = Exercise(title: "Podciąganie", description: "test 111111")
        let exercise2 = Exercise(title: "Pompki", description: "test 222222")
        let exercise3 = Exercise(title: "Przysiady", description: "test 333333")
        let exercise4 = Exercise(title: "Wykroki", description: "test 444444")
        let exercise5 = Exercise(title: "Ugięcia ramion", description: "test 555555")
        
        let tempExercises = [exercise1, exercise2, exercise3, exercise4, exercise5]
        
        return tempExercises
    }
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    //MARK: ACTION
    @IBAction func tapOutside(_ sender: UITapGestureRecognizer) {
//        self.searchBar.resignFirstResponder()
//        self.tableView.becomeFirstResponder()
        self.searchBar.endEditing(true)
    }
     // Logic to add new exercise passed from ExerciseDetailsController
    @IBAction func unwindToExercisesTableView(sender: UIStoryboardSegue ) {
        if let sourceViewController = sender.source as?
            ExerciseDetailsController,
            let exercise = sourceViewController.exercise {

            // Add a new exercise to exercises array
            exercises.append(exercise)
            
            //Apply filter on new exercise title
            let newIndexPath = IndexPath(row: selectedExercises.count, section: 0)
            if let searchBarText = searchBar.text {
                if searchBarText.isEmpty {
                    selectedExercises.append(exercise)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                } else if exercise.title.lowercased().contains(searchBarText.lowercased()) {
                    selectedExercises.append(exercise)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            } else {
                let newIndexPath = IndexPath(row: selectedExercises.count, section: 0)
                selectedExercises.append(exercise)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
        }
    }
    
}

extension ExercisesListViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedExercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exericse = selectedExercises[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExerciseCellViewController
        cell.setExercise(exercise: exericse)
        return cell
    }
    //SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //funkcja wyszukiwania
        guard !searchText.isEmpty else {
            selectedExercises = exercises
            tableView.reloadData()
            return
        }
        selectedExercises = exercises.filter({exercise -> Bool in
           exercise.title.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }

    
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        <#code#>
//    }
//
}


