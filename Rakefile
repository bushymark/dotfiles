require 'rake'
# TODO make this link back to the files in 
# dotfiles instead of files in the templates folder
desc "install the dot files into the users home directory"
task :install do
  replace_all = false
  
  if Dir.getwd != (ENV['HOME'] + '/bin')
    raise "Please move the bin folder to your home directory"
  end
  
  Dir.chdir('dotfiles/templates')
  
  Dir['*'].each do |file|
    puts "checking #{file}"
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
  
  puts "cleaning directory of extra path files"
  ['profile', 'bash_login'].each do |file|
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      puts "renaming ~/.#{file} to ~/.#{file}.bak for inspection later"
      system %Q{mv $HOME/.#{file} $HOME/.#{file}.bak}
    end
  end
  
end




def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
