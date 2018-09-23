use_frameworks!
workspace 'table-log'

# Helper

def iOS_platform
    platform :ios, '9.0'
end

def macOS_platform
    platform :osx, '10.10'
end

def framework_project
    project 'table-log/table-log.xcodeproj'
end

def demo_project
    project 'table-log-demo/table-log-demo.xcodeproj'
end

def shared_pods
    pod 'SwiftLint'
end

# Targets iOS

target 'table-log-ios' do
    iOS_platform
    framework_project
    shared_pods
end

target 'table-log-demo-ios' do
    iOS_platform
    demo_project
    shared_pods
end

# Targets macOS

target 'table-log-macos' do
    macOS_platform
    framework_project
    shared_pods
end

target 'table-log-demo-macos' do
    macOS_platform
    demo_project
    shared_pods
end

target 'table-log-demo-macos-cli' do
    macOS_platform
    demo_project
    shared_pods
end
