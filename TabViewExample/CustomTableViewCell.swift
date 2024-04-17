//
//  CustomTableViewCell.swift
//  TabViewExample
//
//  Created by Antriksh Singh on 16/04/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var tableCellButton: UIButton!
    @IBOutlet weak var tableCellLabel: UILabel!
    
    @IBOutlet weak var priorityText: UILabel!
    
    private var todos : TodoModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization cod
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    
    }

    @IBAction func tableCellButtonClicked(_ sender: Any) {
        todos.isCompleted = !todos.isCompleted
        
        if todos.isCompleted {
            tableCellButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }else{
            tableCellButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        }
        
    }
    
    func config(todos:TodoModel){

        self.todos = todos
        tableCellLabel.text = todos.title

        switch todos.priority {
        case .high:
            priorityText.text = "High"
        case .medium:
            priorityText.text = "Medium"
        case .low:
            priorityText.text = "Low"
        }
        
        let lighterRed = UIColor.red.withAlphaComponent(0.7)
        let lighterYellow = UIColor.yellow.withAlphaComponent(0.7)
        let lighterBlue = UIColor.systemBlue.withAlphaComponent(0.7)
        
        switch todos.priority {
        case .high:
            contentView.backgroundColor = lighterRed
        case .medium:
            contentView.backgroundColor = lighterYellow
        case .low:
            contentView.backgroundColor = lighterBlue
        }
        
        let imageName = todos.isCompleted ? "checkmark.circle" : "xmark"
        tableCellButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
