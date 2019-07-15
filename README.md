## 关于

-基于Alamofire网络请求类的二次封装，用于网络请求

## 需求

- iOS 8.0+
- Xcode 9.0+
- Swift 4.0+

## 安装

### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AlamofireNetWorkRequest'
end
```
## 用法

```swift
import AlamofireNetWorkRequest

class MyViewController: UIViewController {

    override func viewDidLoad() {
    
        super.viewDidLoad()
        AlamofireNetWorkRequest.shareInstance.NetWorkJsonRequest(method: HTTPMethod.post, urlStr: "www.baidu.com", parameters: ["key":"value"]) { (dataJson, requestState) in
        
        
        }

    }
```


