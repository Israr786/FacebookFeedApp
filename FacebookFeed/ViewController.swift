//
//  ViewController.swift
//  FacebookFeed
//
//  Created by Apple on 4/23/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

let cellID = "cellID"

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Facebook Feed"
        collectionView?.backgroundColor = UIColor.init(white:0.95, alpha: 1)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.alwaysBounceVertical = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return  4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
    }


}

class FeedCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let nameLabel : UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 2
        let attributedText = NSMutableAttributedString(string:"Ed Sheeran", attributes:[NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string:"\nDec 10 -- San Francisco", attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 12),NSAttributedStringKey.foregroundColor:UIColor.lightGray]))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
      attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
        
        label.attributedText = attributedText

        return label
        
        
        
    }()
    
    let profileImageView: UIImageView = {
        
        let ImageView = UIImageView()
        ImageView.image = UIImage(named:"ed_pic2")
        ImageView.contentMode = .scaleAspectFit
    //    ImageView.backgroundColor = UIColor.red
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        return ImageView
        
        
        
    }()
    
    let statusTextView : UITextView = {
        let textView = UITextView()
        textView.text = "My Demo status for Facebook"
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        return textView
        
        
        
    }()
    
    let statusImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named:"profile_ed")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
        
        
    }()
    
    let likeCommentLabel : UILabel = {
        let label = UILabel()
        label.text = "488 likes 10.7K Comments"
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.lightGray
        return label
     
    }()
    
    let dividerLineView :UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let likeButton :UIButton = {
        let button = UIButton()
        button.setTitle("Likes", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        return button
  
    }()
    
    let commentButton :UIButton = {
        let button = UIButton()
        button.setTitle("Comment", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        return button
        
    }()
    
    let shareButton :UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        return button
        
    }()
    
    
    func setupViews(){
        
      
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likeCommentLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
       
        addConstraintWithFormat(format:"H:|-8-[v0(44)]-8-[v1]|", views: profileImageView,nameLabel)
        addConstraintWithFormat(format:"H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintWithFormat(format:"H:|[v0]|", views: statusImageView)
        addConstraintWithFormat(format:"H:|-12-[v0]|", views: likeCommentLabel)
        addConstraintWithFormat(format:"H:|-12-[v0]-12-|", views: dividerLineView)
        addConstraintWithFormat(format:"H:|[v0(v2)][v1(v2)][v2]|", views:likeButton,commentButton,shareButton)
        addConstraintWithFormat(format:"V:|-12-[v0]", views: nameLabel)
        addConstraintWithFormat(format:"V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView,statusTextView,statusImageView,likeCommentLabel,dividerLineView,likeButton)
        addConstraintWithFormat(format:"V:[v0(44)]|", views: commentButton)
        addConstraintWithFormat(format:"V:[v0(44)]|", views: shareButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView {
    
    func addConstraintWithFormat(format:String,views:UIView...) {
        var viewsDictionary = [String : UIView]()
        for(index,view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    
    
}
