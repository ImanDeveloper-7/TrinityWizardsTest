//
//  ContactsListVC.swift
//  TrinityWizardsTest
//
//  Created by Iman Zabihi on 30/06/2022.
//

import UIKit

class ContactsListVC: UIViewController {

    @IBOutlet weak var tbl_contacts: UITableView!
    
    var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.doGetContacts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ContactDetailVC {
            guard let indexPath = sender as? IndexPath else { return }
            
            let contact = self.contacts[indexPath.row]
            
            vc.firstName = contact.firstName
            vc.lastName = contact.lastName
            vc.email = contact.email
            vc.phone = contact.phone
        }
    }
    
    private func setupUI() {
        self.tbl_contacts.register(ContactCell.nib(), forCellReuseIdentifier: ContactCell.identifier)
    }
    
    private func doGetContacts() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = NSData(contentsOf: url)
            
            if let data = jsonData {
                let contacts = try JSONDecoder().decode([Contact].self, from: data as Data)
                self.contacts.append(contentsOf: contacts)
                DispatchQueue.main.async {
                    self.tbl_contacts.reloadData()
                }
            }
            
        } catch {
            print("ERROR: \(error)")
        }
    }
}

extension ContactsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as? ContactCell else {
            fatalError("ContactCell not found")
        }
        
        let contact = self.contacts[indexPath.row]
        
        if let firstName = contact.firstName,
           let lastName = contact.lastName {
            cell.lbl_name.text = "\(firstName) \(lastName)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "goToDetails", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
