Pod::Spec.new do |s|
  s.name         = "HKCycleTableView"
  s.version      = "0.0.8"
  s.summary      = "添加测试HKCycleTableView"
  s.description  = <<-DESC 
                          添加测试HKCycleTableView的工具
                   DESC
  s.homepage     = "https://github.com/genghongkai/HKCycleTableView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "genghongkai" => "1159538747@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/genghongkai/HKCycleTableView.git", :tag => "0.0.2" }
  s.source_files  = "HKCycleTableView", "HKCycleTableView/**/*.{h,m}"
  s.framework  = "UIKit"
end