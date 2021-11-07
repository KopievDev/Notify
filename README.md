# Notify 
```swift
// Пример
class ViewController: UIViewController {
    
    @IBAction func didTapOnButton(_ sender: Any) {
        Notify.showSuccsess(title: "Hello Bro\nHow are you!?") {
            self.view.backgroundColor = .systemPink
        }
    }
}

```
```swift
Notify.showSuccsess(title: "Hello Bro\nHow are you!?")

```
