require 'lib/filewatcher.rb'

describe FileWatcher do
  
  before(:all) do
    `touch file`
  end
  after(:all) do
    `rm file`
  end
  
  
  it 'should throw an error when file doesn\'t exist' do
    
    lambda {
      FileWatcher.new 'nofile' do 
        puts 'changed'
      end
    }.should raise_error
    
  end
  
  
  it 'should call the block when file is touched' do
    
    count = 0
    
    watcher = FileWatcher.new 'file' do
      count += 1
    end
    
    sleep 1
    `touch file`
    
    watcher.process
    
    count.should == 1
    
  end
  
  it 'should not call on unmodified file' do
    
    
    count = 0
    
    watcher = FileWatcher.new 'file' do
      count += 1
    end
    
    watcher.process
    
    count.should == 0
    
    
  end
  
  
  it 'should autoreprocess' do
    
    count = 0
    
    watcher = FileWatcher.new 'file' do
      count += 1
    end
    
    watcher.auto_reprocess 0.5
    
    count.should == 0
    
    sleep 1
    
    `touch file`
    
    sleep 1
    
    count.should == 1
    
    
    `touch file`
    
    sleep 1
    
    count.should == 2
    
  end
  
  
end