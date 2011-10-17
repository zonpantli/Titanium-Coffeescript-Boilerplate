require 'nokogiri'
require 'colored'
require 'fileutils'

require File.expand_path(File.join(Dir.pwd, 'config/config.rb'))
include Config

PERL_COLOR_FILTER = %Q{| perl -pe 's/^\\[DEBUG\\].*$/\\e[35m$&\\e[0m/g;s/^\\[INFO\\].*$/\\e[36m$&\\e[0m/g;s/^\\[WARN\\].*$/\\e[33m$&\\e[0m/g;s/^\\[ERROR\\].*$/\\e[31m$&\\e[0m/g;'}

task :default => ["build:iphone"]

namespace :compile do
  desc "Compile all assets"
  task :all do
    compile
  end

  desc "Compile SASS to JSS"
  task :styles do
    compile_sass
  end

  desc "Compile CoffeeScript into JS"
  task :coffee do
    compile_coffee
  end
end

namespace :build do

  desc "Build the app for iPhone and run in simulator"
  task :iphone do
    build :device => 'iphone'
  end
  
  desc "Build the app for android and install to attached device / emulator"
  task :android do
    build :device => 'android'
  end

end

namespace :install do
  desc "Build for Andrdoid and install to physical device"
  task :android do
    install :device => 'android'
  end
end


namespace :clean do
  
  desc "Clean Android build directory"
  task :android do
    FileUtils.rm_r Dir.glob('build/android/*'), :force => true
    puts "Cleaned build/android".blue
  end
  
  desc "Clean iPhone build directory"
  task :iphone do
    FileUtils.rm_r Dir.glob('build/iphone/*'), :force => true
    puts "Cleaned build/iphone".blue
  end
  
  desc "Clean android and iphone build directories"
  task :all do
    Rake::Task["clean:iphone"].execute
    Rake::Task["clean:android"].execute
  end
  
end

def compile_coffee
  puts "Compiling CoffeeScript".blue
  paths = `find app/bar_wallet -name '*.coffee'`.split("\n")
  compilation = (
  system "coffee -p #{paths.join(' ')} > Resources/bar_wallet.js" and
  system "coffee -p --bare app/app.coffee > Resources/app.js"
  )

  if compilation
    puts "Successfully compiled CoffeeScript".green
  else
    puts "Error compiling CoffeeScript".red
  end

  compilation
end

def build(options={})
  return unless compile_coffee
  options[:device] ||= 'iphone'
  
  puts "Building with Titanium... (DEVICE_TYPE: #{options[:device]})".blue
  case options[:device]
  when 'iphone'
    sh %Q{bash -c "#{TI_IPHONE_BUILD} run #{PROJECT_ROOT}/ #{IPHONE_SDK_VERSION} #{APP_ID} #{APP_NAME} #{options[:device]} " #{PERL_COLOR_FILTER}}
  when 'android'
    sh %Q{bash -c "#{TI_ANDROID_BUILD} simulator #{APP_NAME} #{ANDROID_SDK_DIR} #{PROJECT_ROOT}/ #{APP_ID} #{ANDROID_SDK_ID}" #{PERL_COLOR_FILTER}}
  end
end

def install(options={})
  return unless compile
  options[:device] ||= 'android'
  
  puts "Building with Titanium... (DEVICE_TYPE: #{options[:device]})".blue
  case options[:device]
  when 'android'
    sh %Q{bash -c "#{TI_ANDROID_BUILD} install #{APP_NAME} #{ANDROID_SDK_DIR} #{PROJECT_ROOT}/ #{APP_ID} #{ANDROID_SDK_ID}" #{PERL_COLOR_FILTER}}
  end
end



