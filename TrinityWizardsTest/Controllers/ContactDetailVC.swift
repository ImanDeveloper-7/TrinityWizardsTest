//
//  ContactDetailVC.swift
//  TrinityWizardsTest
//
//  Created by Iman Zabihi on 30/06/2022.
//

import UIKit

class ContactDetailVC: UIViewController {
    
    @IBOutlet weak var img_contact: UIImageView!
    @IBOutlet weak var txt_firstName: UITextField!
    @IBOutlet weak var txt_lastName: UITextField!
    @IBOutlet weak var txt_phone: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    
    var firstName: String?
    var lastName: String?
    var phone: String?
    var email: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.loadContactDetail()
    }
    
    private func setupUI() {
        self.img_contact.makeRounded()
    }
    
    private func loadContactDetail() {
        DispatchQueue.main.async {
            self.txt_firstName.text = self.firstName
            self.txt_lastName.text = self.lastName
            self.txt_phone.text = self.phone
            self.txt_email.text = self.email
        }
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
