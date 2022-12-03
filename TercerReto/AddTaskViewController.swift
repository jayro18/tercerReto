//
//  AddTaskViewController.swift
//  TercerReto
//
//  Created by Jayro Adilson Alhuay Galindo on 2/12/22.
//

import UIKit

protocol AddTaskViewControllerDelegate {
    func addTaskViewController(_ viewController : AddTaskViewController , didCreateTask newTask : Task)
}

class AddTaskViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var priorityTextField: UITextField!
    
    
    var delegate : AddTaskViewControllerDelegate?
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true)
    }
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        let nameTF = titleTextField.text
        let descriptionTF = descriptionTextField.text
        let priorityTF = priorityTextField.text
        
        
        guard let name = nameTF, !name.isEmpty else { return  }
        guard let description = descriptionTF, !description.isEmpty else { return }
        guard let priority = priorityTF, !priority.isEmpty else { return }
        
        let newTask = Task(title: name, description: description, priority: priority)
        
        delegate?.addTaskViewController(self, didCreateTask: newTask)
  
        
        dismiss(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    
    }
    



}
