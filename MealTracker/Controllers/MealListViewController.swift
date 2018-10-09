//
//  MealListViewController.swift
//  MealTracker
//
//  Created by Александр Макаров on 09.10.2018.
//  Copyright © 2018 Александр Макаров. All rights reserved.
//

import UIKit

class MealListViewController: UITableViewController {
    
    var meals: [Meal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMeals()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func saveMeals() {
        
    }
    
    func loadMeals() {
        meals += [
            Meal(
                name: "ТАНКОБУРГЕР",
                photo: UIImage(named: "tankoburger")!,
                notes: "Тяжелая основа двойного подкрепления, усиленная 100% говядиной и золотистыми ломтиками деревенской картошки, расплавленным сыром Чеддер, хрустящим луком, зеленым салатом, кольцами свежего лука и маринованными огурчиками в миксе фирменных соусов.",
                rating: 3,
                timestamp: Date()
            ),
            Meal(
                name: "СЫРНЫЙ ДЖО",
                photo: UIImage(named: "sirniy-djo")!,
                notes: "Наслаждайтесь вкусом сочной 100% говядины, жаренной на гриле, с щедрой порцией сыра Пармезан, сыра Чеддер, свежими помидорами и хрустящим салатом с несравненным соусом Цезарь и Сырным соусом.",
                rating: 3,
                timestamp: Date()
            ),
            Meal(
                name: "БЕКОНАЙЗЕР",
                photo: UIImage(named: "Bekonizer")!,
                notes: "Бекон, двойная порция говядины на гриле, много сыра.",
                rating: 3,
                timestamp: Date()
            ),
            Meal(
                name: "ВОППЕР",
                photo: UIImage(named: "Washper")!,
                notes: "Это вкуснейшая приготовленная на огне 100% говядина с сочными помидорами, свежим нарезанным листовым салатом, густым майонезом, томатным кетчупом, хрустящими маринованными огурчиками и свежим луком на нежной булочке с кунжутом.",
                rating: 3,
                timestamp: Date()
            ),
            Meal(
                name: "ВОППЕР С СЫРОМ",
                photo: UIImage(named: "Washper_Cheeese")!,
                notes: "Приготовленный на огне бифштекс из 100% говядины, два нежных ломтика сыра, сочные помидоры, свежий нарезанный салат, густой майонез, хрустящие огурчики и свежий лук на нежной булочке с кунжутом.",
                rating: 3,
                timestamp: Date()
            ),
            Meal(
                name: "ВОППЕР ДЖУНИОР",
                photo: UIImage(named: "Washper_Junior")!,
                notes: "Приготовленный на огне бифштекс из 100% говядины, сочный помидор, свежий нарезанный салат, густой майонез, хрустящие огурчики и свежий лук на мягкой булочке, посыпанной кунжутом.",
                rating: 3,
                timestamp: Date()
            )
        ]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        cell.imageView?.image = meal.photo

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MealDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let DVC = segue.destination as! MealDetailViewController
                DVC.meal = meals[indexPath.row]
            }
        }
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        
    }

}
