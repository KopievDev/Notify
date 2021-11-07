//
//  Notify.swift
//  Notify
//
//  Created by Ivan Kopiev on 07.11.2021.
//

import UIKit

/// Вызов уведомления
enum Notify {
    
    /// Выводит уведомление  (NotificationView)
    /// - Parameters:
    ///   - title: Уведомление
    ///   - type: Цвет уведомления  (по умолчанию серый)
    ///   - duration: Время показа в секундах (по умолчанию 2 сек)
    ///   - haptic: Тактильный отклик (Haptic Engine) (по умолчанию success)
    ///   - completion: Блок завершения  (по умолчанию nil)
    static func showWith(title: String, type: NotificationView.ColorType = .gray, duration: TimeInterval = 2, haptic: UINotificationFeedbackGenerator.FeedbackType = .success, _ completion: (()->Void)? = nil) {
        let alert =  NotificationView(title: title, type: type, delay: duration, haptic: haptic, completion: completion)
        alert.present()
    }
    
    /// Выводит уведомление с изображением (NotificationView)
    /// - Parameters:
    ///   - title: Уведомление
    ///   - type: Цвет уведомления  (по умолчанию серый)
    ///   - duration: Время показа в секундах (по умолчанию 2 сек)
    ///   - haptic: Тактильный отклик (Haptic Engine)  (по умолчанию success)
    ///   - image: Изображение (по умолчанию nil)
    ///   - completion: Блок завершения  (по умолчанию nil)
    static func showWith(title: String, image: UIImage?, type: NotificationView.ColorType = .gray, duration: TimeInterval = 2, haptic: UINotificationFeedbackGenerator.FeedbackType = .success, _ completion: (()->Void)? = nil) {
        let alert = NotificationView(title: title, image: image, type: type, delay: duration, haptic: haptic, completion: completion)
        alert.present()
    }
    
    /// Выводит успешное уведомление (NotificationView)
    /// - Parameters:
    ///   - title: Уведомление
    ///   - type: Цвет уведомления  (по умолчанию серый)
    ///   - duration: Время показа в секундах (по умолчанию 2 сек)
    ///   - haptic: Тактильный отклик (Haptic Engine)  (по умолчанию success)
    ///   - image: Изображение (по умолчанию "checkmark.circle")
    ///   - completion: Блок завершения  (по умолчанию nil)
    static func showSuccsess(title: String,
                            image: UIImage? = UIImage(systemName: "checkmark.circle")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal),
                            type: NotificationView.ColorType = .gray,
                            duration: TimeInterval = 2,
                            haptic: UINotificationFeedbackGenerator.FeedbackType = .success, _ completion: (()->Void)? = nil) {
        let alert = NotificationView(title: title, image: image, type: type, delay: duration, haptic: haptic, completion: completion)
        alert.present()
    }
    /// Выводит уведомление с ошибкой (NotificationView)
    /// - Parameters:
    ///   - title: Уведомление
    ///   - type: Цвет уведомления  (по умолчанию серый)
    ///   - duration: Время показа в секундах (по умолчанию 2 сек)
    ///   - haptic: Тактильный отклик (Haptic Engine)  (по умолчанию error)
    ///   - image: Изображение (по умолчанию "xmark.circle")
    ///   - completion: Блок завершения  (по умолчанию nil)
    static func showError(title: String,
                            image: UIImage? = UIImage(systemName: "xmark.circle")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal),
                            type: NotificationView.ColorType = .gray,
                            duration: TimeInterval = 2,
                            haptic: UINotificationFeedbackGenerator.FeedbackType = .error, _ completion: (()->Void)? = nil) {
        let alert = NotificationView(title: title, image: image, type: type, delay: duration, haptic: haptic, completion: completion)
        alert.present()
    }
    
}

/// Модальное представление уведомления
class NotificationView: UIView {
    //MARK: - Properies
    enum Colors {
        static var red: UIColor {UIColor(red: 0.906, green: 0.235, blue: 0.243, alpha: 1)}
        static var darkRed: UIColor {UIColor(red: 0.58, green: 0.16, blue: 0.16, alpha: 1)}
        static var gray: UIColor {UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)}
        static var darkGray: UIColor {UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1)}
        static var littleGray: UIColor {UIColor(red: 0.235, green: 0.235, blue: 0.235, alpha: 1)}
        static var yellow: UIColor {UIColor(red: 1, green: 0.882, blue: 0, alpha: 1)}
        static var darkYellow: UIColor {UIColor(red: 0.85, green: 0.77, blue: 0.15, alpha: 1)}
        static var green: UIColor {UIColor(red: 0.28, green: 0.78, blue: 0.75, alpha: 1)}
        static var darkGreen: UIColor {UIColor(red: 0.2, green: 0.7, blue: 0.6, alpha: 1)}
    }
    /// Цветовое оформление уведомления
    enum ColorType {
        case gray, yellow
    }
    
    private let formView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.littleGray
        view.accessibilityLabel = "Form"
        return view
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.accessibilityLabel = "Icon"
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Oops..."
        label.numberOfLines = 2
        label.font = UIFont(name: "Roboto-Regular", size: 13)
        label.sizeToFit()
        label.textColor = .white
        label.accessibilityLabel = "Title"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var delay: TimeInterval = 2.0
    private var haptic: UINotificationFeedbackGenerator.FeedbackType = .success
    private var imageCnst = [NSLayoutConstraint]()
    private var withoutImageCnst = [NSLayoutConstraint]()
    private var completion: (()->Void)?
    private var dissmisFromGesture: Bool = false
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(title: String = "Opps...",
         image: UIImage?,
         type: NotificationView.ColorType = .gray,
         delay: TimeInterval = 2,
         haptic: UINotificationFeedbackGenerator.FeedbackType = .success,
         completion: (()->Void)? = nil) {
        self.init()
        titleLabel.text = title
        imageView.image = image
        self.delay = delay
        self.haptic = haptic
        self.completion = completion
        switch type {
        case .gray:
            formView.backgroundColor = Colors.littleGray
            titleLabel.textColor = .white
        case .yellow:
            formView.backgroundColor = Colors.yellow
            titleLabel.textColor = .black
        }
        checkImageView()
        
    }
    
    convenience init(title: String,
                     type: NotificationView.ColorType = .gray,
                     delay: TimeInterval = 2,
                     haptic: UINotificationFeedbackGenerator.FeedbackType = .success,
                     completion: (()->Void)? = nil) {
        self.init()
        self.delay = delay
        self.haptic = haptic
        self.completion = completion
        titleLabel.text = title
        switch type {
        case .gray:
            formView.backgroundColor = Colors.littleGray
            titleLabel.textColor = .white
        case .yellow:
            formView.backgroundColor = Colors.yellow
            titleLabel.textColor = .black
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dropShadow(for: formView)
    }

    deinit {
        #if DEBUG
        print("✅[Notify] - Deinit notification")
        #endif
    }
    
    // MARK: - Helpers
    @objc public func present() {
        guard let window = UIApplication.shared.windows.first else {return}
        window.addSubview(self)
        window.bringSubviewToFront(self)
        autoresizingMask = [.flexibleWidth]
        frame = CGRect(x: 0, y: -100, width: window.frame.width, height: 100)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 100)
        }
        Haptic.notification(haptic)
        perform(#selector(dissmis), with: nil, afterDelay: delay)
        #if DEBUG
        print("✅[Notify] - Present notification")
        #endif
    }
    
    private func setUp() {
        isUserInteractionEnabled = true
        addSubview(formView)
        formView.addSubview(titleLabel)
        createConstraints()
        addSwipe()
    }
    
    private func addSwipe() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handle(swipe:)))
        swipeUp.direction = .up
        addGestureRecognizer(swipeUp)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handle(swipe:)))
        swipeLeft.direction = .left
        addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handle(swipe:)))
        swipeRight.direction = .right
        addGestureRecognizer(swipeRight)
    }
    
    @objc private func handle(swipe: UISwipeGestureRecognizer) {
        #if DEBUG
        print("✅[Notify] - Notification swiped")
        #endif
        var offsetPoint: CGPoint = CGPoint(x: 0, y: -100)
        switch  swipe.direction {
        case .left: offsetPoint = CGPoint(x: -frame.width, y: 0)
        case .right: offsetPoint = CGPoint(x: +frame.width, y: 0)
        default: break
        }
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.frame = CGRect(x: offsetPoint.x, y: offsetPoint.y, width: self.frame.width, height: 100)
            self.completion?()
        } completion: { _ in
            self.dissmisFromGesture = true
            self.removeFromSuperview()
        }
        
    }
    
    @objc func dissmis() {
        if superview != nil {
            UIView.animate(withDuration: 0.3) {
                self.alpha = 0
                if !self.dissmisFromGesture {
                    self.completion?()
                }
            } completion: { _ in
                self.removeFromSuperview()
                
            }
        }
    }
    
    private func createConstraints() {
        imageCnst = [
            formView.centerXAnchor.constraint(equalTo: centerXAnchor),
            formView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            formView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.656),
            
            titleLabel.topAnchor.constraint(equalTo: formView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: formView.bottomAnchor, constant: -10),
            
            imageView.heightAnchor.constraint(equalTo: formView.heightAnchor, multiplier: 0.5),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 10),
        ]
        
        withoutImageCnst = [
            formView.centerXAnchor.constraint(equalTo: centerXAnchor),
            formView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            formView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.656),
            
            titleLabel.topAnchor.constraint(equalTo: formView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: formView.bottomAnchor, constant: -10),
        ]
        
       checkImageView()
       
    }
    
    private func checkImageView() {
        if imageView.image != nil {
            formView.addSubview(imageView)
            NSLayoutConstraint.deactivate(withoutImageCnst)
            NSLayoutConstraint.activate(imageCnst)
        } else {
            NSLayoutConstraint.activate(withoutImageCnst)
        }
    }
    
    fileprivate func dropShadow(for view: UIView) {
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.3
        view.layer.shadowPath = CGPath(roundedRect: view.bounds, cornerWidth: 10, cornerHeight: 10, transform: nil)
    }

    @objc private func doNotDoAnything() {}

}

enum Haptic {
    
   static func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: style)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
    static func selection() {
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
        selectionFeedbackGenerator.selectionChanged()
    }
    
    static func notification(_ style:UINotificationFeedbackGenerator.FeedbackType) {
        let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
        notificationFeedbackGenerator.prepare()
        notificationFeedbackGenerator.notificationOccurred(style)
    }
    
}

extension UIView {
    
   fileprivate func pulsate() {
        let key = "pulsate"
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = 1
        pulse.fromValue = 1
        pulse.toValue = 0.98
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        layer.add(pulse, forKey: key)
    }
}
