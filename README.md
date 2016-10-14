# StretchHeader

## Demo
![Dome](https://raw.githubusercontent.com/y-hryk/StretchHeader/master/sample_01.gif)
![Dome](https://raw.githubusercontent.com/y-hryk/StretchHeader/master/sample_02.gif)

## Requirement
- iOS 8.0 or later
- Swift 3.0 or later

> NOTE: Swift 2.x support is still available at version 1.0.x

#### Manually
 Copy StretchHeader directory to your project.

#### CocoaPods
 Add pod 'StretchHeader' to your Podfile.
 ```
 pod 'StretchHeader'
 ```
 
## Usage
 ```swift
 
  var header : StretchHeader!
 
  override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        setupHeaderView()
    }
    
    func setupHeaderView() {
        
        let options = StretchHeaderOptions()
        options.position = .underNavigationBar
        
        header = StretchHeader()
        header.stretchHeaderSize(headerSize: CGSize(width: view.frame.size.width, height: 220),
            imageSize: CGSize(width: view.frame.size.width, height: 220),
            controller: self,
            options: options)
        header.imageView.image = UIImage(named: "photo_sample_05")
        
        // custom
        let label = UILabel()
        label.frame = CGRect(x: 10, y: header.frame.size.height - 40, width: header.frame.size.width - 20, height: 40)
        label.textColor = UIColor.white
        label.text = "StrechHeader Demo"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        header.addSubview(label)
        
        tableView.tableHeaderView = header
    }
    
    // MARK: - ScrollView Delegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        header.updateScrollViewOffset(scrollView)
    }
```
## Licence
MIT

## Other Library
- [YSLContainerViewController](https://github.com/y-hryk/YSLContainerViewController)
- [YSLTransitionAnimator](https://github.com/y-hryk/YSLTransitionAnimator)
- [YSLGoogleSuggestView](https://github.com/y-hryk/YSLGoogleSuggestView)
- [YSLDraggableCardContainer](https://github.com/y-hryk/YSLDraggableCardContainer)
