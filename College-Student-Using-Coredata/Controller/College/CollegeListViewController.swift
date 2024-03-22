//
//  CollegeListViewController.swift
//  College-Student-Using-Coredata
//
//  Created by NTS on 20/03/24.
//

import UIKit

class CollegeListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var arrayOfData = [College]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.arrayOfData = DatabaseHelper.shareInstance.getAllCollegeData()
        self.tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let formVC = storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(formVC, animated: true)
    }
    
}

extension CollegeListViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeListTableViewCell", for: indexPath) as! CollegeListTableViewCell
        cell.college = arrayOfData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185.0
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayOfData = DatabaseHelper.shareInstance.deleteCollegeData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "CollegeDetailTableViewController") as! CollegeDetailTableViewController
        detailVC.collegeDetail = arrayOfData[indexPath.row]
        detailVC.indexRow = indexPath.row
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


