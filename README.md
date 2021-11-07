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
![Simulator-Screen-Recording-iPhone-12-Pro-Max-2021-11-07-at-13 22 32](https://user-images.githubusercontent.com/78022759/140641693-c05b7b1c-5e2a-4602-b1cd-0e146b840fc3.gif)
