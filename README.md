# IOS_async_image
[swift] spring(서버)에서 url로 이미지 가져오기


# AsyncImage
```swift
AsyncImage(url: URL(string: imageUrl)) { image in
  image
    .resizable()
    .scaledToFit()
  } placeholder: {
    Image(systemName: "photo")
      .resizable()
      .scaledToFit()
      .foregroundColor(Color.gray)
}
 ```
 
 # refresh Image
 > refresh Method
 ```swift
// refresh delegate
  func needToRefresh() {
    // make 'serverData' by json decode 'data'
    imageUrl = "http://localhost:8080/image?value=compose"
}
```
> How to use
```swift
Button {
  needToRefresh()
} label: {
  Text("이미지 불러오기")
}
```

# Code
```swift

struct ContentView: View {
    
    @State private var imageUrl = ""
    var body: some View {
        VStack {
            Button {
                needToRefresh()
            } label: {
                Text("이미지 불러오기")
            }
        }
        
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.gray)
        }
        
    }
    
    // refresh delegate
    func needToRefresh() {
        // make 'serverData' by json decode 'data'
        imageUrl = "http://localhost:8080/image?value=compose"
    }
}
```

# 이미지명을 변수로 지정
> refresh method
```swift
// refresh delegate
func needToRefresh(_ imageName: String) {
  // make 'serverData' by json decode 'data'
  imageUrl = "http://localhost:8080/image?value=" + imageName
}
```

> how to use
``` swift
Button {
  needToRefresh("compose")
} label: {
  Text("이미지 불러오기")
}
```

> 2023.02.19.(SUN)
>  - 서버에서 이미지 가져오기 구현 (비동기)<br>
>  - 이미지 한 장만 URL로 지정하여 가져옴
---

