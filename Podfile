use_frameworks!
workspace 'table-print'

# Helper

def iOS_platform
    platform :ios, '9.0'
end

def macOS_platform
    platform :osx, '10.10'
end

def framework_project
    project 'table-print/table-print.xcodeproj'
end

def demo_project
    project 'table-print-demo/table-print-demo.xcodeproj'
end

def shared_pods
    pod 'SwiftLint'
end

# Targets iOS

target 'table-print-ios' do
    iOS_platform
    framework_project
    shared_pods
end

target 'table-print-demo-ios' do
    iOS_platform
    demo_project
    shared_pods
end

# Targets macOS

target 'table-print-macos' do
    macOS_platform
    framework_project
    shared_pods
end

target 'table-print-demo-macos' do
    macOS_platform
    demo_project
    shared_pods
end

target 'table-print-demo-macos-cli' do
    macOS_platform
    demo_project
    shared_pods
end
