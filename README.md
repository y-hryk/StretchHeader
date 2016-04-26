# StretchHeader

## Demo
![Dome](https://raw.githubusercontent.com/y-hryk/StretchHeader/master/sample_01.gif)
![Dome](https://raw.githubusercontent.com/y-hryk/StretchHeader/master/sample_02.gif)

## Requirement
iOS 7.0 or later

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
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        setupHeaderView()
    }
    
    func setupHeaderView() {
        
        let options = StretchHeaderOptions()
        options.position = .UnderNavigationBar
        
        header = StretchHeader()
        header.stretchHeaderSize(headerSize: CGSizeMake(view.frame.size.width, 220),
            imageSize: CGSizeMake(view.frame.size.width, 220),
            controller: self,
            options: options)
        header.imageView.image = UIImage(named: "photo_sample_05")
        
        // custom
        let label = UILabel()
        label.frame = CGRectMake(10, header.frame.size.height - 40, header.frame.size.width - 20, 40)
        label.textColor = UIColor.whiteColor()
        label.text = "StrechHeader Demo"
        label.font = UIFont.boldSystemFontOfSize(16)
        header.addSubview(label)
        
        tableView.tableHeaderView = header
    }
    
    // MAEK: - ScrollView Delegate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
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
