# Notify 
```swift
// Example
class ViewController: UIViewController {
 
   @IBAction func didTapOnButton(_ sender: Any) {
        Notify.showSuccsess(title: "Hello Bro\nHow are you!?") {[weak self] in
            self?.view.backgroundColor = .systemPink
        }
    }

}

```
```swift
Notify.showSuccsess(title: "Message")
Notify.showError(title: "Message")
Notify.showWith(title: "Message", image: nil, type: .gray, duration: 3, haptic: .success) {
    //Comletion handler 
}

```
| showSuccsess  | showError |
| ------------- | ------------- |
|![Simulator-Screen-Recording-iPhone-12-Pro-Max-2021-11-07-at-13 22 32](https://user-images.githubusercontent.com/78022759/140641693-c05b7b1c-5e2a-4602-b1cd-0e146b840fc3.gif)|![Simulator-Screen-Recording-iPhone-12-Pro-Max-2021-11-07-at-13 49 35](https://user-images.githubusercontent.com/78022759/140641917-e984f301-c1cc-440e-9ab1-aa7c54218ee1.gif)|

