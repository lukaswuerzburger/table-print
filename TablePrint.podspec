Pod::Spec.new do |s|
    s.name = "TablePrint"
    s.version = "0.2"
    s.summary = "TablePrint is a tool designed for developers. It prints tables of dictionaries in the debugger console."
    s.author = "Lukas Würzburger"
    s.license = { :type => "MIT" }
    s.homepage = "https://github.com/lukaswuerzburger/table-print"
    s.platform = :ios
    s.source = { :git => "https://github.com/lukaswuerzburger/table-print.git", :tag => "0.2" }
    s.source_files = "table-print/Sources/*.swift"
    s.ios.deployment_target = "9.0"
    s.ios.frameworks = 'Foundation'
    s.requires_arc = true
end
