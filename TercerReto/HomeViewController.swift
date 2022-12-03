//
//  HomeViewController.swift
//  TercerReto
//
//  Created by Jayro Adilson Alhuay Galindo on 2/12/22.
//

import UIKit

class HomeViewController: UITableViewController {

    var taskArray : [Task] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let task = taskArray[indexPath.row]
        
        cell.textLabel?.text=task.title
        

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detalle", sender: self)
    }
    



}

extension HomeViewController{
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        
        if segue.identifier == "detalle"{
            if let id = tableView.indexPathForSelectedRow{
                let fila = taskArray[id.row]
                let destino = segue.destination as? DetailViewController
                destino?.taskDetail = fila
                destino?.idTask = id.row
                destino?.delegate = self
            }
        }else{
           
            let destination = nav?.viewControllers.first as? AddTaskViewController
            
            destination?.delegate = self
        }
        
    }
}


extension HomeViewController : AddTaskViewControllerDelegate{
    func addTaskViewController(_ viewController: AddTaskViewController, didCreateTask newTask: Task) {
        taskArray.append(newTask)
        tableView.reloadData()
    }
    
    
}

extension HomeViewController : DetailViewControllerDelegate{
    func eliminarTarea(_ viewController: DetailViewController, didDeleteTask idTask: Int) {
        taskArray.remove(at: idTask)
        tableView.reloadData()
    }
    
}
