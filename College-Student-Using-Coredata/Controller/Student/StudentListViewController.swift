//
//  StudentListViewController.swift
//  College-Student-Using-Coredata
//
//  Created by NTS on 21/03/24.
//

import UIKit

class StudentListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var studentArray = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "studentCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        studentArray = DatabaseHelper.shareInstance.getAllStudentData()
        self.tableView.reloadData()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let studentFormVC = storyboard?.instantiateViewController(withIdentifier: "StudentFormViewController") as! StudentFormViewController
        self.navigationController?.pushViewController(studentFormVC, animated: true)
    }
}

extension StudentListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell with the identifier
        var cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        // If the dequeued cell is nil, create a new cell
        if cell != nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "studentCell")
        }
        
        // Configure the cell with student data
        cell.textLabel?.text = studentArray[indexPath.row].name
        cell.detailTextLabel?.text = studentArray[indexPath.row].phone
        
        return cell
    }


    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121.0
    }
    
}
