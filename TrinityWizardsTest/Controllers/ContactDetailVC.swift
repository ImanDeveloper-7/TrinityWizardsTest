//
//  ContactDetailVC.swift
//  TrinityWizardsTest
//
//  Created by Iman Zabihi on 30/06/2022.
//

import UIKit

class ContactDetailVC: UIViewController {
    
    var contacts: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
