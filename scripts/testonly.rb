class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

def command_prefix
  "/opt/dev/bin/dev test " # "bundle exec ruby -Itest "
end

def command_filelist(files)
  files.join(" ")
end

def execute_command(files, command)
  if files.any?
    puts "running: #{command}\n"
    Kernel.exec(command)
  else
    puts "No matching tests found."
  end
end

args = ARGV
if args.include? '-n'
  tests_regex = args.slice!(args.index('-n')..args.size).drop(1).join('|')
  command_suffix = " -n /#{tests_regex}/"
elsif args.delete '-a'
  command_suffix = " -n /asdf/"
end

files_regex = args.map(&:underscore).join('|')
files = Dir['test/**/*_test.rb'].select {|dir| dir =~ /#{files_regex}/ }

command = command_prefix
command << command_filelist(files)
command << command_suffix if command_suffix
execute_command(files, command)
