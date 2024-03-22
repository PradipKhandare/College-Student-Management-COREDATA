//
//  DatabaseHelper.swift
//  College-Student-Using-Coredata
//
//  Created by NTS on 20/03/24.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper
{
    static let shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveCollegeData(collegeDict: [String: String]) {
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = collegeDict["collegeName"]
        college.city = collegeDict["collegeCity"]
        college.address = collegeDict["collegeAddress"]
        college.university = collegeDict["collegeUniversity"]
        
        do{
            try context.save()
        }catch let error {
            print("Error in saving data. \(error.localizedDescription)")
        }
    }
    
    
    func getAllCollegeData() -> [College]{
        var arrCollege = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            arrCollege = try context.fetch(fetchRequest) as! [College]
        }catch let error{
            print("Error in fetching data.\(error.localizedDescription)")
        }
        return arrCollege
    }
    
    
    func deleteCollegeData(index: Int) ->[College]{
        var collegeData = self.getAllCollegeData()
        context.delete(collegeData[index])
        collegeData.remove(at: index)
        
        do{
            try context.save()
        }catch let error{
            print("Error in deleting the data. \(error.localizedDescription)")
        }
        return collegeData
    }
    
    func editCollegeData(collegeDict: [String: String], index: Int) {
        var college = self.getAllCollegeData()
        
        //Original Data
        college[index].name = collegeDict["collegeName"]
        college[index].address = collegeDict["collegeAddress"]
        college[index].city = collegeDict["collegeCity"]
        college[index].university = collegeDict["collegeUniversity"]
        
        do{
            try context.save()
        }catch let error {
            print("Error in data editing. \(error.localizedDescription)")
        }
    }
    
    func saveStudentData(studentDict: [String: String]) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.name = studentDict["studentName"]
        student.email = studentDict["studentEmail"]
        student.phone = studentDict["studentPhone"]
        do{
            try context.save()
        }catch let error {
            print("Error in saving data. \(error.localizedDescription)")
        }
    }
    
    
    func getAllStudentData() -> [Student]{
        var arrStudent = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            arrStudent = try context.fetch(fetchRequest) as! [Student]
        }catch let error{
            print("Error in fetching data.\(error.localizedDescription)")
        }
        return arrStudent
    }
    
}
