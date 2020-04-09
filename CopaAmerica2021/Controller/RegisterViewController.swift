//
//  RegisterViewController.swift
//  CopaAmerica2021
//
//  Created by Gustavo Huaracc  on 4/4/20.
//  Copyright © 2020 Gustavo Huaracc . All rights reserved.
//

import UIKit


public class RegisterViewController: UIViewController {

    @IBOutlet weak var btnConfirmRegister: UIButton!
    @IBOutlet weak var edtEmail: UITextField!
    @IBOutlet weak var edtLastName: UITextField!
    @IBOutlet weak var edtName: UITextField!
    @IBOutlet weak var imageProfile: UIImageView!
    var urlImage = ""
    var nameProfile = ""
    var lastNameProfile = "";
    var emailProfile = ""
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        style()
        setImage()
        setData()
    }
    func setData(){
        edtName.text = nameProfile
        edtLastName.text = lastNameProfile
        edtEmail.text = emailProfile
    }
    func setImage(){
        if let url = NSURL(string: urlImage){
            if let data = NSData(contentsOf: url as URL){
                imageProfile.contentMode = UIView.ContentMode.scaleAspectFit
                imageProfile.image = UIImage(data: data as Data)
            }
        }
        
    }
    
   /* func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if textField == address {
           self.view.endEditing(true)
           return false
        }
    }*/
    
    func style(){
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.edtName.frame.height))
        
        let paddingedtLastName = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.edtLastName.frame.height))
        let paddingedtEmail = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.edtEmail.frame.height))
        
        btnConfirmRegister.layer.cornerRadius = 23
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width/2
        imageProfile.clipsToBounds = true
        
        edtLastName.layer.cornerRadius = 23
        edtLastName.clipsToBounds = true
        edtLastName.layer.borderWidth = 1
        edtLastName.layer.borderColor =  UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor

        edtLastName.leftView = paddingedtLastName
        edtLastName.leftViewMode = .always
        
        
        edtName.layer.cornerRadius = 23
        edtName.clipsToBounds = true
        edtName.layer.borderWidth = 1
        edtName.layer.borderColor =  UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor

        edtName.leftView = padding
        edtName.leftViewMode = .always
    
        edtEmail.layer.cornerRadius = 23
        edtEmail.clipsToBounds = true
        edtEmail.layer.borderWidth = 1
        edtEmail.layer.borderColor =  UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        
        edtEmail.leftView = paddingedtEmail
        edtEmail.leftViewMode = .always
    



    }
    

    
    
    

}

