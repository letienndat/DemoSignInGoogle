//
//  HomeViewController.swift
//  DemoSignInGoogle
//
//  Created by Lê Tiến Đạt on 22/2/25.
//

import UIKit
import GoogleSignIn

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var idUser: UILabel!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var email: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData()
    }
    
    private func loadData() {
        guard let user = UserContext.shared.fetchUser() else { return }
        
        idUser.text = user.id
        name.text = user.name
        email.text = user.email
    }

    @IBAction func handleTappedBtnSignout(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signOut()
        goToAuth()
    }
    
    private func goToAuth() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = storyboard.instantiateInitialViewController() {
            view.window?.rootViewController = homeVC
            view.window?.makeKeyAndVisible()
        }
    }
}
