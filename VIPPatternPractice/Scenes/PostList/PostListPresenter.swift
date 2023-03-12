//
//  PostListPresenter.swift
//  VIPPatternPractice
//
//  Created by 강민혜 on 3/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PostListPresentationLogic
{
    func presentPostList(response: PostList.FetchPostList.Response)
}

class PostListPresenter: PostListPresentationLogic
{
    weak var viewController: PostListDisplayLogic?
    
    // MARK: Do something
    
    // 인터렉터 -> 프리젠터로 온 것
    // 날것의 데이터를 받음
    func presentPostList(response: PostList.FetchPostList.Response)
    {
        
        typealias DisplayedPost = PostList.FetchPostList.ViewModel.DisplayedPost
        
        let displayedPosts = response.posts.map { DisplayedPost(post: $0) } // 날것의 데이터를 가공해서 담아
        
        let viewModel = PostList.FetchPostList.ViewModel(displayedPosts: displayedPosts) // 가공한 데이터를 viewmodel에 담아서
        viewController?.displayPostList(viewModel: viewModel) // viewcontroller로 넘겨
    }
}
