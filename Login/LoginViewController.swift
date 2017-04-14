//
//  LoginViewController.swift
//  Login
//
//  Created by Paige Plander on 4/5/17.
//  Copyright © 2017 Paige Plander. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Constants used in the LoginViewController
    struct Constants {
        static let backgroundColor: UIColor = UIColor(hue: 0.5389, saturation: 1, brightness: 0.92, alpha: 1.0)
        static let invalidEmailTitle = "Invalid username or password"
        static let invalidEmailMessage = "Please try again"
    }

    // TODO: instantiate the views needed for your project
    let midView: UIView = {
        let myView = UIView()
        myView.backgroundColor = UIColor.white
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.cornerRadius = 5
        myView.layer.masksToBounds = true
        return myView
    } ()
    let titleView: UIView = {
        let myView = UIView()
        
        myView.backgroundColor = UIColor.clear
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.cornerRadius = 5
        myView.layer.masksToBounds = true
        return myView
    } ()
    
    let logButton: UIButton = {
        
        
        let butto = UIButton()
        butto.backgroundColor = UIColor.green
        butto.setTitle("login", for: .normal)
        butto.translatesAutoresizingMaskIntoConstraints = false
        
        
        butto.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return butto
    }()
    func handleRegister() {
        print("123")
        print(nameTextField.text!)
        authenticateUser(username: nameTextField.text!, password: passwordTF.text!)
        
    
    }
    
    let nameTextField: UITextField = {
        let ntf = UITextField()
        ntf.placeholder = "Name"
        ntf.translatesAutoresizingMaskIntoConstraints = false
        
        return ntf
    
    }()
    
    let passwordTF: UITextField = {
        let ntf = UITextField()
        ntf.placeholder = "Password"
        ntf.translatesAutoresizingMaskIntoConstraints = false
        
        return ntf
        
    }()
    
    let titleLabel: UILabel = {
        let tdp = UILabel()
        //tdp.backgroundColor = UIColor.brown
        tdp.text = "Login View Controller"
        tdp.translatesAutoresizingMaskIntoConstraints = false
        //tdp.numberOfLines = 2
        return tdp
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        
        // TODO: Add your views either as subviews of `view` or subviews of each other using `addSubview`
        view.addSubview(midView)
        midView.addSubview(logButton)
        midView.addSubview(nameTextField)
        midView.addSubview(passwordTF)
        
        view.addSubview(titleView)
        titleView.addSubview(titleLabel)
        // TODO: layout your views using frames or AutoLayout
        setupmidView()
        setuptitleView()
    }
    
    // TODO: create an IBAction for your login button
    
    func setupmidView() {
        midView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        midView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        midView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        midView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        //set name text field
        nameTextField.topAnchor.constraint(equalTo: midView.topAnchor, constant: 0).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: midView.leftAnchor, constant: 12).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: midView.widthAnchor, constant: -24).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: midView.heightAnchor, multiplier: 1/3).isActive = true
        //set password text field
        passwordTF.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 0).isActive = true
        passwordTF.leftAnchor.constraint(equalTo: midView.leftAnchor, constant: 12).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: midView.widthAnchor, constant: -24).isActive = true
        passwordTF.heightAnchor.constraint(equalTo: midView.heightAnchor, multiplier: 1/3).isActive = true
        //set login button
        logButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 0).isActive = true
        logButton.leftAnchor.constraint(equalTo: midView.leftAnchor, constant: 12).isActive = true
        logButton.widthAnchor.constraint(equalTo: midView.widthAnchor, constant: -24).isActive = true
        logButton.heightAnchor.constraint(equalTo: midView.heightAnchor, multiplier: 5/16).isActive = true
    }
    
    
    func setuptitleView() {
        
        
        titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
        titleView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        //set up text
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        //titleLabel.widthAnchor.constraint(equalTo: titleView.widthAnchor, constant: -24).isActive = true
        //titleLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        

    }
    
    
    
    /// YOU DO NOT NEED TO MODIFY ANY OF THE CODE BELOW (but you will want to use `authenticateUser` at some point)
    
    // Model class to handle checking if username/password combinations are valid.
    // Usernames and passwords can be found in the Lab6Names.csv file
    let loginModel = LoginModel(filename: "Lab6Names")

    /// Imageview for login success image (do not need to modify)
    let loginSuccessView = UIImageView(image: UIImage(named: "oski"))
    
    /// If the provided username/password combination is valid, displays an
    /// image (in the "loginSuccessView" imageview). If invalid, displays an alert
    /// telling the user that the login was unsucessful.
    /// You do not need to edit this function, but you will want to use it for the lab.
    ///
    /// - Parameters:
    ///   - username: the user's berkeley.edu address
    ///   - password: the user's first name (what a great password!)
    func authenticateUser(username: String?, password: String?) {
        
        // if username / password combination is invalid, present an alert
        if !loginModel.authenticate(username: username, password: password) {
            loginSuccessView.isHidden = true
            let alert = UIAlertController(title: Constants.invalidEmailTitle, message: Constants.invalidEmailMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        // If username / password combination is valid, display success image
        else {
            if !loginSuccessView.isDescendant(of: view) {
                view.addSubview(loginSuccessView)
                loginSuccessView.contentMode = .scaleAspectFill
            }
            
            loginSuccessView.isHidden = false
            
            // Constraints for the login success view
            loginSuccessView.translatesAutoresizingMaskIntoConstraints = false
            loginSuccessView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loginSuccessView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            loginSuccessView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            loginSuccessView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        }
    }
}
