Pod::Spec.new do |s|
  s.name         = 'ZYDatePickController'
  s.version      = '1.0'
  s.platform     = :iOS, '9.0'
  s.license      = 'MIT'
  s.summary      = 'A DatePickController that likes the UIAlertController.'
  spec.homepage     = 'https://github.com/NSLogxiaoyu3/ZYDatePickerController'
  spec.author       = { 'iDev_01' => 'ideveloper_mahao@163.com' }
  spec.source       = { :git => 'git@github.com:NSLogxiaoyu3/ZYDatePickerController.git', :tag => '1.0' }
  s.source_files = 'ZYDatePickerController/*.{h,m}'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true
  s.dependency 'Masonry'
end
