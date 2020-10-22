<p align="center">
<img src="https://img.shields.io/badge/build-passing-brightgreen.svg" alt="Passing"/>
<img src="https://img.shields.io/badge/platform-iOS-brightgreen.svg" alt="Platform: iOS"/>
<img src="https://img.shields.io/badge/Xcode-9%2B-brightgreen.svg" alt="XCode 9+"/>
<img src="https://img.shields.io/badge/iOS-9%2B-brightgreen.svg" alt="iOS 9+"/>
<img src="https://img.shields.io/badge/pod-1.6-lightr.svg" alt="1.6"/>
<img src="https://img.shields.io/badge/licence-MIT-lightgray.svg" alt="Licence MIT"/>
</a>
</p>




# ZYDatePickerController

Just look at the Example and use!

You can use block or delegate.


## Screenshots

<div white-space:nowrap>
<img width="250px" src="https://github.com/NSLogxiaoyu3/ZYDatePickerController/blob/master/Screenshots-en.png" />
<img width="250px" src="https://github.com/NSLogxiaoyu3/ZYDatePickerController/blob/master/Screenshots-zh_Hans.png" />
<img width="250px" src="https://github.com/NSLogxiaoyu3/ZYDatePickerController/blob/master/Screenshots-zh_Hant.png" />
</div>

## Installation with CocoaPods
[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries.

``` ruby
pod "ZYDatePickerController"
```

## Usage

It is quite easy to use, you can use this by two methods, one is for block, another is for delegate.

### block

``` objc

__weak typeof(self) weakSelf = self;
ZYDatePickerController *datePickController = [[ZYDatePickerController alloc] initWithMessage:NSLocalizedString(@"pleaseChooseDate", nil) dateFormat:@"yyyy-MM-dd" handler:^(NSString *dateString) {
    __strong typeof(weakSelf) strongSelf = weakSelf;
    strongSelf.textField.text = dateString;
}];
[self presentViewController:datePickController animated:YES completion:nil];

```

### delegate

the delegate example comes sooner

## Authors

* **iDev_01** - [iDev01](https://github.com/iDev01)

## Communication

* If you **found a bug**, open an issue.
* If you **have a feature request**, open an issue.
* If you **want to contribute**, submit a pull request.

## License

MIT LICENSE

Copyright (C)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
