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
    var emailProfile = ""
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        style()
        setImage()
        setData()
    }
    func setData(){
        edtName.text = nameProfile
        edtLastName.text = nameProfile
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
    func style(){
        btnConfirmRegister.layer.cornerRadius = 23
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width/2
        imageProfile.clipsToBounds = true
    
    }
    
    
    

}

