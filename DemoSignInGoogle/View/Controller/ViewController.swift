//
//  ViewController.swift
//  DemoSignInGoogle
//
//  Created by Lê Tiến Đạt on 22/2/25.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func handleTappedBtnLoginGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            guard let userSignIn = signInResult?.user else { return }

            let user = User(
                id: userSignIn.userID ?? "",
                name: userSignIn.profile?.name ?? "",
                email: userSignIn.profile?.email ?? "")
            UserContext.shared.saveUser(user)
            
            self.goToHome()
        }
    }
    
    private func goToHome() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        if let homeVC = storyboard.instantiateInitialViewController() {
            view.window?.rootViewController = homeVC
            view.window?.makeKeyAndVisible()
        }
    }

}

