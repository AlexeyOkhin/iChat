//
//  ActiveChatCell.swift
//  iChat
//
//  Created by Djinsolobzik on 23.08.2022.
//


import UIKit

protocol SelfConfiguringCell {
    static var reuserID: String { get }
    
    func configure(with value: MChat)
}

final class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuserID: String = "ActiveChatCell"
    
    let friendImageView = UIImageView()
    let friendName = UILabel(name: "Bob", font: .laoSangaMN20())
    let lastMessage = UILabel(name: "Hello mark", font: .LaoSangam18())
    let gradientView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func configure(with value: MChat) {
        friendImageView.image = UIImage(named: value.userImageString)
        friendName.text = value.username
        lastMessage.text = value.lastMessage
        gradientView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -  Private Methods

private extension ActiveChatCell {
    
    func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(friendImageView)
        addSubview(friendName)
        addSubview(lastMessage)
        addSubview(gradientView)
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImageView.topAnchor.constraint(equalTo: topAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            friendImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            friendName.topAnchor.constraint(equalTo: topAnchor, constant: 6)
        ])
        
        NSLayoutConstraint.activate([
            lastMessage.topAnchor.constraint(equalTo: friendName.bottomAnchor, constant: 8),
            lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor),
            gradientView.widthAnchor.constraint(equalToConstant: 18)
        ])
    }
}

