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
    
    let temporaryResults = ["Krakow", "Warsaw"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
    }
    
    @IBAction func getLocationPressed(_ sender: UIBarButtonItem) {
    }
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: K.segueIdentifier , sender: self)
    }
}

// MARK: - UITableViewDataSourch
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temporaryResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIndetifier, for: indexPath)
        cell.textLabel?.text = temporaryResults[indexPath.row]
        return cell
    }
    
}
