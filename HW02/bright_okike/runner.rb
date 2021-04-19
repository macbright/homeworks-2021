require_relative "hw02"

arr = [2,3,2,5]

def test1(arr)
    include My_enumerables
    arr.my_select() do |el|
      el 
    end
end

print test1(arr)