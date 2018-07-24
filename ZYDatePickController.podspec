Pod::Spec.new do |s|
  s.name         = 'ZYDatePickController'
  s.version      = '1.0'
  s.platform     = :iOS, '9.0'
  s.license      = 'MIT'
  s.summary      = 'A DatePickController that likes the UIAlertController.'
  spec.homepage     = 'https://github.com/NSLogxiaoyu3/ZYDatePickerController'
  spec.author       = { 'iDev_01' => 'ideveloper_mahao@163.com' }
  spec.source       = { :git => 'git@github.com:NSLogxiaoyu3/ZYDatePickerController.git', :tag => 'v1.0' }
  spec.requires_arc = true
  spec.dependency 'Masonry'
end
