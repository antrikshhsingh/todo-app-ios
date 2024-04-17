// ViewController.swift

import UIKit

// Conformance of Delegate
class ViewController: UIViewController, AddTodoDelegate {
    
    
    @IBOutlet weak var table: UITableView!
    
    var todos : [TodoModel] = [
        TodoModel(title: "Wash clothes", isCompleted: false, priority: .high),
        TodoModel(title: "Dance", isCompleted: false, priority: .low),
        TodoModel(title: "Drink water", isCompleted: false, priority: .medium),
        TodoModel(title: "Gym", isCompleted: false, priority: .high)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todos App"
        table.delegate = self
        table.dataSource = self
        
        table.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        table.rowHeight = 60
        table.separatorStyle = .none
    }
    
    
    @IBAction func addTodo(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddTodoController") as! AddTodoController
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func addTodo(_ todo: TodoModel) {
        todos.append(todo)
        table.reloadData()
    }
    
    
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User tapped at \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.config(todos: todos[indexPath.row])
        return cell
    }
}
