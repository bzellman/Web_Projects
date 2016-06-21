## Fibonacci with itteration

def fibs(array, n)
  n.times do |i|
    array[i+1] = array[i] + array[i-1]
  end
end

# fibs([1], 5)

## Fibonacci with recursion
def fibs_rec(array, n)
    return array if n == 1
    array[-2] ? array << array[-1] + array[-2] : array << array[-1]
    fibs_rec(array, n-1)
end

puts fibs_rec([1], 5)