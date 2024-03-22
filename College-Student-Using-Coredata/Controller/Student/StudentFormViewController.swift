//
//  StudentFormViewController.swift
//  College-Student-Using-Coredata
//
//  Created by NTS on 21/03/24.
//

import UIKit

class StudentFormViewController: UIViewController {

    
    @IBOutlet var allTextFields: [UITextField]!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        self.saveStudentData()
    }
}

extension StudentFormViewController
{
    func saveStudentData(){
        guard let name = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let phone = mobileTextField.text else { return }
        
        var studentDict = [
            "studentName": name,
            "studentEmail": email,
            "studentPhone": phone
        ]
        DatabaseHelper.shareInstance.saveStudentData(studentDict: studentDict)
    }
}
