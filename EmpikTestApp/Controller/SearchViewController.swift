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
    
    let resultsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(SearchViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func getLocationPressed(_ sender: UIBarButtonItem) {
    }
}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        resultsTableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: K.segueIdentifier , sender: self)
        print(indexPath.row)
    }
}

// MARK: - UITableViewDataSourch
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIndetifier, for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = "'\(searchTextField.text!)'"
        }else {
            cell.textLabel?.text = resultsArray[indexPath.row-1]
        }
        return cell
    }
    
}
