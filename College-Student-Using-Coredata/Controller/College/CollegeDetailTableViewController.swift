//
//  CollegeDetailTableViewController.swift
//  College-Student-Using-Coredata
//
//  Created by NTS on 20/03/24.
//

import UIKit

class CollegeDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var studentLabel: UILabel!
    
    
    var collegeDetail : College?
    var indexRow = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = collegeDetail?.name ?? ""
        addressLabel.text = collegeDetail?.address ?? ""
        cityLabel.text = collegeDetail?.city ?? ""
        universityLabel.text = collegeDetail?.university ?? ""
    }
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        let formVC = storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        formVC.isUpdate = true
        formVC.collegeDetails = collegeDetail
        formVC.indexRow = indexRow
        self.navigationController?.pushViewController(formVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            let studentListVC = self.storyboard?.instantiateViewController(withIdentifier: "StudentListViewController") as! StudentListViewController
            self.navigationController?.pushViewController(studentListVC, animated: true)
        }
    }
    
}
