//
//  ViewController.swift
//  CopaAmerica2021
//
//  Created by Gustavo Huaracc  on 3/30/20.
//  Copyright © 2020 Gustavo Huaracc . All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

public class ViewController: UIViewController {
    
    @IBOutlet weak var btnFacebook: UIButton!
    var url = ""
    var name = ""
    var lastName = ""
    var email = ""
    override public func viewDidLoad() {
        super.viewDidLoad()
        styleButton()
    }
    
    func styleButton(){
        btnFacebook.layer.cornerRadius = 23
    }
    
    
    @IBAction func loginFbTapped(_ sender: Any) {
        fbLogin()
    }
    
    func fbLogin(){
        let loginManager = LoginManager()
        loginManager.logOut()
        loginManager.logIn(permissions: [ .publicProfile, .email,.userFriends], viewController: self){ LoginResult in
            switch LoginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("login cancelled")
            case .success(_, _, _):
                print("login in")
                self.getFBUserData()
            }
            
        }
        
    }

    func getFBUserData() {
        
        if((AccessToken.current) != nil){
            
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email, gender"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    let dict = result as! [String : AnyObject]
                    print(result!)
                    print(dict)
                    let picutreDic = dict as NSDictionary
                    let tmpURL1 = picutreDic.object(forKey: "picture") as! NSDictionary
                    let tmpURL2 = tmpURL1.object(forKey: "data") as! NSDictionary
                    let finalURL = tmpURL2.object(forKey: "url") as! String
                    self.url = finalURL
                    
                    self.name = picutreDic.object(forKey: "name") as! String
                    

                    if let emailAddress = picutreDic.object(forKey: "email") {
                        self.email = emailAddress as! String
                    }
                    else {
                        var usrName = self.name
                        usrName = usrName.replacingOccurrences(of: " ", with: "")
                         self.email = usrName+"@facebook.com"
                    }
                    
                }
                self.performSegue(withIdentifier:"selfUIController", sender: self)
                print(error?.localizedDescription as Any)
            })
        }
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let vc = segue.destination as! RegisterViewController
        vc.urlImage = self.url
        vc.nameProfile = self.name
        vc.emailProfile = self.email
        
    }
    
    
}

