Pod::Spec.new do |s|
  s.name = 'ZYDatePickerController'
  s.version = '1.5'
  s.platform = :ios, '11.4'
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = 'A DatePickController that likes the UIAlertController.'
  s.homepage = 'https://github.com/NSLogxiaoyu3/ZYDatePickerController'
  s.author = { 'NSLogxiaoyu3' => 'ideveloper_mahao@163.com' }
  s.source = { :git => 'https://github.com/NSLogxiaoyu3/ZYDatePickerController.git', :tag => "v#{s.version}" }
  s.source_files = 'ZYDatePickerController/*.{h,m}'
  s.resource     = 'ZYDatePickerController/ZYDatePickerController.bundle'
  s.frameworks = 'Foundation', 'UIKit'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.dependency 'Masonry'
end
