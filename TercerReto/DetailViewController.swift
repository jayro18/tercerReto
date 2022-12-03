//
//  DetailViewController.swift
//  TercerReto
//
//  Created by Jayro Adilson Alhuay Galindo on 2/12/22.
//

import UIKit


protocol DetailViewControllerDelegate {
    func eliminarTarea(_ viewController : DetailViewController , didDeleteTask idTask : Int)
}


class DetailViewController: UIViewController {
     var delegate : DetailViewControllerDelegate?
    
    var taskDetail : Task?
    var idTask: Int = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var priorityLabel: UILabel!
    

    
    @IBAction func deleteButton(_ sender: UIButton) {
        
//      guard let id = idTask else {return}
//        guard let homeViewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {return}

        delegate?.eliminarTarea(self, didDeleteTask: idTask)
       navigationController?.popViewController(animated: true)
      
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = taskDetail?.title
        descriptionLabel.text = taskDetail?.description
        priorityLabel.text = taskDetail?.priority
    }
 



}


