//
//  SearchViewController.swift
//  EmpikTestApp
//
//  Created by Michael on 7/26/23.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var resultsTableView: UITableView!
    
    var resultsArray = [String]()
    var cityManager = CityManager()
    var cityName = ""
    var stop = false
    var location = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.register(UINib(nibName: K.resultTableViewCell, bundle: nil), forCellReuseIdentifier: K.tabCellIndetifier)
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(SearchViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
    

}

// MARK: - CLLocationManagerDelegate
extension SearchViewController {
    @IBAction func getLocationPressed(_ sender: UIBarButtonItem) {
        location = true
        performSegue(withIdentifier: K.segueIdentifier , sender: self)
    }
}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        resultsArray = cityManager.getCityNames(for: textField.text!)
        resultsTableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        stop = true
        if indexPath.section == 0 {
            cityName = searchTextField.text!
        }else {
            cityName = resultsArray[indexPath.row]
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            performSegue(withIdentifier: K.segueIdentifier , sender: self)
            return
        }
        if resultsArray[indexPath.row] != K.defaultResult {
            performSegue(withIdentifier: K.segueIdentifier , sender: self)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("text-")
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" && stop == false {
            cityName = searchTextField.text!
            performSegue(withIdentifier: K.segueIdentifier , sender: self)
            return true
        }else{
            searchTextField.placeholder = "Type a City name."
            return false
        }
    }
    
}

// MARK: - UITableViewDataSourch
extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 && searchTextField.text != "" {
            return 1
        }else {
            return resultsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Sugested City names: "
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tabCellIndetifier, for: indexPath) as! SearchTableViewCell
        if indexPath.section == 0 {
            cell.resultTextLabel.text = "'\(searchTextField.text!)'"
        }else {
            cell.resultTextLabel.text = resultsArray[indexPath.row]
        }
        return cell
    }
    
}

// MARK: - PrepareForSegue
extension SearchViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segueIdentifier {
            let destinationVC = segue.destination as! WeatherViewController
            if location {
                destinationVC.location = location
            }else {
                destinationVC.cityName = cityName
            }
        }
    }
}
