class FWatch
  
  def initialize file, &block
    @file = File.new file
    @block = block
    @mtime = @file.stat.mtime
  end
  
  
  # Check for file modifications and call the block
  # if the file has been updated
  def process
    if @mtime < @file.stat.mtime
      @mtime = @file.stat.mtime
      @block.call unless @block.nil?
    end
  end
  
  # Starts a thread that keeps to check the
  # file on a set interval
  def auto_reprocess timeout = 1
    Thread.new do
      while true
        sleep timeout
        process
      end
    end
  end
  
end
