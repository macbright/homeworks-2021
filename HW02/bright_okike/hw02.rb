module My_enumerables
    def my_each
      self.length.times do |x|
        yield(self[x])
      end
    end

    def my_map(proc = nil)
      arr = Array.new
      if proc 
        self.length.times do |x|
          arr.push(proc.call(self[x]))
        end
      else 
        self.length.times do |x|
          arr.push(yield(self[x]))
        end
      end
      arr
    end

    def my_select
      arr = Array.new
      self.length.times do |x|
        if yield(self[x])
          arr.push(self[x])
        end
      end
      arr
    end

    

    def my_all?
      self.length.times do |x|
        if !yield(self[x])
          return false
        else 
          return true
        end
      end
    end


    def my_any?
      self.length.times do |x|
        if yield(self[x]) != false
          return true
        end
      end
      false
    end


    def my_none?
      self.length.times do |x|
        if yield(self[x]) 
          return false
        end
      end
      true
    end


    def my_count arg=nil
      arr = []
      if block_given?
          # i = 0
          arr = self.my_select {|x| yield x}
      elsif arg != nil
          arr = self.my_select {|x| x == arg}

      else 
          return self.size 
      end
      arr.size
    end


    def my_inject(n = 0)
       out = n
      self.my_each do |x|
        out = yield(out, x)
      end
      return out
    end
    
end

arr = [2,3,2,5]

def test1(arr)
    include My_enumerables
    arr.my_select() do |x|
      x 
    end
end

print test1(arr)