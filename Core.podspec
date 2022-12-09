Pod::Spec.new do |spec|
spec.name         = "Core"
spec.version      = "0.0.1"
spec.summary      = "Brief description"
spec.description  = <<-DESC
This is a way longer description
DESC
spec.homepage     = "https://www.my_homepage.com"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author             = { "author" => "author@gmail.com" }
spec.documentation_url = "https://link_to_documentation.com"
spec.platforms = { :ios => "13.0", :osx => "10.15", :watchos => "6.0" }
spec.swift_version = "5.1"
spec.source       = { :git => "https://link_to_my_repository.git", :tag => "#{spec.version}" }
spec.source_files  = "Sources/Core/**/*.swift"
spec.xcconfig = { "SWIFT_VERSION" => "5.5" }
spec.dependency 'SomeOtherPod_Dependency_1'
spec.dependency 'SomeOtherPod_Dependency_2'
end
