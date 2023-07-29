//
//  SettingViewController.swift
//  EmpikTestApp
//
//  Created by Michael on 7/29/23.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var intervalsStepper: UIStepper!
    @IBOutlet weak var intervalsLabel: UILabel!
    @IBOutlet weak var histroyTableView: UITableView!
    @IBOutlet weak var historyLabel: UILabel!
    
    var historyArray = [String]()
    var position = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        histroyTableView.delegate = self
        histroyTableView.dataSource = self
        histroyTableView.register(UINib(nibName: K.resultTableViewCell, bundle: nil), forCellReuseIdentifier: K.tabCellIndetifier)
        if UserDefaults.standard.array(forKey: K.UserDefaults.savedHistory) != nil {
            historyArray = UserDefaults.standard.array(forKey: K.UserDefaults.savedHistory) as! [String]
        }
        if historyArray.count == 0 {
            historyLabel.isHidden = true
            histroyTableView.isHidden = true
        }
        if UserDefaults.standard.double(forKey: K.UserDefaults.savedIntervales) != 0.0 {
            print(UserDefaults.standard.double(forKey: K.UserDefaults.savedIntervales))
            intervalsStepper.value = UserDefaults.standard.double(forKey: K.UserDefaults.savedIntervales)
            intervalsLabel.text = String(Int(UserDefaults.standard.double(forKey: K.UserDefaults.savedIntervales)))
        }else{
            intervalsStepper.value = 5
        }
    }
    
    @IBAction func intervalsStepperPressed(_ sender: UIStepper) {
        intervalsLabel.text = "\(Int(sender.value))"
        UserDefaults.standard.set(sender.value, forKey: K.UserDefaults.savedIntervales)
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        position = indexPath.row
        performSegue(withIdentifier: K.Segues.historySegue , sender: self)
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tabCellIndetifier, for: indexPath) as! SearchTableViewCell
        cell.resultTextLabel.text = historyArray[indexPath.row]
        return cell
    }
    
    
}

// MARK: - PrepareForSegue
extension SettingViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.historySegue {
            let destinationVC = segue.destination as! WeatherViewController
            destinationVC.cityName = historyArray[position]
        }
    }
}
