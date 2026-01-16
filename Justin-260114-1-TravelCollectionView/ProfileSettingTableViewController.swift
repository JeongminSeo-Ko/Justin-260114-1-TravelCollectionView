//
//  ProfileSettingTableViewController.swift
//  Justin-260114-1-TravelCollectionView
//
//  Created by 서정민 on 1/15/26.
//

import UIKit

class ProfileSettingTableViewController: UITableViewController {
    
    static let identifier = "ProfileSettingTableViewController"
    
    @IBOutlet var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .groupTableViewBackground
        
        tableView.keyboardDismissMode = .onDrag
        
        navigationItem.title = "프로필 수정"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        
        setNicknameTextField()
    }
    
    @objc func rightBarButtonItemClicked() {
        UserDefaults.standard.set(nicknameTextField.text, forKey: "nickname")
        navigationController?.popViewController(animated: true)
    }
    
    func setNicknameTextField() {
        nicknameTextField.textColor = .black
        nicknameTextField.borderStyle = .none
        
        if let nick = UserDefaults.standard.string(forKey: "nickname") {
            nicknameTextField.text = nick
        } else {
            nicknameTextField.text = ""
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "사용자 정보"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "사용하실 닉네임을 입력해주세요"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
