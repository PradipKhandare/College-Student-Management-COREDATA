//
//  CollegeFormViewController.swift
//  College-Student-Using-Coredata
//
//  Created by NTS on 20/03/24.
//

import UIKit

class CollegeFormViewController: UIViewController {
    
    @IBOutlet var allTextFields: [UITextField]!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var universitytextField: UITextField!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    var isUpdate = false
    var indexRow = Int()
    var collegeDetails : College?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.text = collegeDetails?.name
        self.cityTextField.text = collegeDetails?.city
        self.addressTextField.text = collegeDetails?.address
        self.universitytextField.text = collegeDetails?.university
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate {
            saveButtonOutlet.setTitle("Update", for: .normal)
        }else {
            saveButtonOutlet.setTitle("Save", for: .normal)
        }
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        self.saveCollegeData()
        let alert = UIAlertController(title: "Saved", message: "Data saved successfully", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { action in
            for textfield in self.allTextFields {
                textfield.text = ""
            }
            let listVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeListViewController") as! CollegeListViewController
            self.navigationController?.pushViewController(listVC, animated: true)
            
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}

//MARK: - Methods.
extension CollegeFormViewController
{
    func saveCollegeData(){
        guard let collegeName = nameTextField.text else {return }
        guard let collegeAddress = addressTextField.text else {return }
        guard let collegeCity = cityTextField.text else {return }
        guard let collegeUniversity = universitytextField.text else {return }
        
        let collegeDictionary = [
            "collegeName": collegeName,
            "collegeAddress": collegeAddress,
            "collegeCity": collegeCity,
            "collegeUniversity": collegeUniversity
        ]
        
        if isUpdate
        {
            DatabaseHelper.shareInstance.editCollegeData(collegeDict: collegeDictionary, index: indexRow)
            let detailVC = storyboard?.instantiateViewController(withIdentifier: "CollegeDetailTableViewController") as! CollegeDetailTableViewController
            self.navigationController?.pushViewController(detailVC, animated: true)
            let alert = UIAlertController(title: "Saved", message: "Data updated successfully", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
            isUpdate = false
        }else {
            DatabaseHelper.shareInstance.saveCollegeData(collegeDict: collegeDictionary)
        }
       
    }
}
