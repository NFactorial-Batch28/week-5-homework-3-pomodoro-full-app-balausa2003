//
//  SettingsTableViewCell.swift
//  PomodoroTimer
//
//  Created by Балауса Косжанова on 09.05.2023.
//

import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    static var identifier = "cell"
    
    
    lazy var focusTime: UILabel = {
        let text = UILabel()
        text.text = "Focus time"
        text.textColor = .white
        
        return text
    }()
    
    lazy var textField: UITextField = {
       let field = UITextField()
        field.placeholder = "25:00"
        field.textColor = .white
        field.backgroundColor = .black
        field.attributedPlaceholder = NSAttributedString(string: "25:00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return field
    }()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(focusTime)
        contentView.addSubview(textField)
        contentView.backgroundColor = .black
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupConstraints() {
        focusTime.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(13)
        }
        textField.snp.makeConstraints { make in
            make.leading.equalTo(focusTime.snp.trailing).inset(50)
            make.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalTo(focusTime)
        }
    }
}
