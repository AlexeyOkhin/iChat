//
//  WaitingChatCell.swift
//  iChat
//
//  Created by Djinsolobzik on 24.08.2022.
//

import UIKit

final class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuserID = "WaitingChatCell"
    
    let imageChat = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with value: MChat) {
        imageChat.image = UIImage(named: value.userImageString)
    }
    
    private func configureConstraints() {
        imageChat.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageChat)
        
        NSLayoutConstraint.activate([
            imageChat.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageChat.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageChat.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageChat.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    
}
