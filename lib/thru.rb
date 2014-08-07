require "thru/version"
require "open3"

class String

  def thru(*command)
    stdout, status = Open3.capture2(*command, stdin_data: self)
    raise "#{status}" unless status == 0
    stdout
  end

  alias_method :|, :thru

end

