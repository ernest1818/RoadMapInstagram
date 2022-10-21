//
//  Notifications.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 19.10.2022.
//

import Foundation

/// Cтруктура описывающая приходящие уведомления
struct UsersNotifications {
    
    enum Actions: String {
        case likeVideo = "нравиться ваше видео."
        case likePhoto = "нравиться ваше фото."
        case likeComment = "понравился ваш комментарий."
        case prioritetFollow = "есть в Instagramm. Вы можете знать этого"
        case following = "подписался(-ась) на ваши обновления."
    }
    
    let userName: String
    let userImageName: String
    let userAction: Actions
    let contentImageName: String?
    let time: String?
}
