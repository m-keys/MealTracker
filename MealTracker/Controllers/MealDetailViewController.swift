//
//  MealDetailViewController.swift
//  MealTracker
//
//  Created by Александр Макаров on 09.10.2018.
//  Copyright © 2018 Александр Макаров. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var ratingControl: UIPickerView!
    
    var pickerDataSource = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ratingControl.dataSource = self
        self.ratingControl.delegate = self
        
        if let meal = meal {
            update(meal)
        }

        // Do any additional setup after loading the view.
    }
    
    func update(_ meal: Meal) {
        photoImageView.image = meal.photo
        nameTextField.text = meal.name
        notesTextField.text = meal.notes
        ratingTextField.text = String(meal.rating)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ratingTextField.text = pickerDataSource[row]
    }

}
