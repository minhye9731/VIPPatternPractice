//
//  PostListInteractor.swift
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

protocol PostListBusinessLogic
{
    func fetchPostList(request: PostList.FetchPostList.Request)
}

protocol PostListDataStore
{
    //var name: String { get set }
}

class PostListInteractor: PostListBusinessLogic, PostListDataStore
{
    var presenter: PostListPresentationLogic?
    var worker: PostListWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    // 뷰 -> 인터렉터한테 시키는 것
    func fetchPostList(request: PostList.FetchPostList.Request) // request도 usecase를 통해 가져옴
    {
        worker = PostListWorker()
        guard let postList = worker?.fetchPostList(count: request.count) else { return } // 인터렉터한테서 받아온 날것의 데이터
        
        let response = PostList.FetchPostList.Response(posts: postList)
        presenter?.presentPostList(response: response)
    }
}
