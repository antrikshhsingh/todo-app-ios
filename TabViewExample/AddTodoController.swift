//
//  AddTodoController.swift
//  TabViewExample
//
//  Created by Antriksh Singh on 16/04/24.
//

import UIKit

class AddTodoController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    
    //Adapting the delegate
    var delegate : AddTodoDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add tap gesture recognizer to dismiss keyboard
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
         view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        // Dismiss the keyboard
        view.endEditing(true)
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty else {
               displayAlert(message: "Title is required.")
               return
           }
        
        let priority: Priority
        switch prioritySegmentedControl.selectedSegmentIndex {
        case 0:
            priority = .high
        case 1:
            priority = .medium
        case 2:
            priority = .low
        default:
            priority = .medium
        }
        
        let newTodo = TodoModel(title: title, isCompleted: false, priority: priority)
        delegate?.addTodo(newTodo)
        dismiss(animated: true)
    }
    
    func displayAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

protocol AddTodoDelegate{
    func addTodo(_ todo: TodoModel)
}
