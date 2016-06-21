def fibs(n)
  array = [1]
  n.times do |i|
    array[i+1] = array[i] + array[i-1]
  end

  puts "#{array}"
end

# fibs(5)

def fibs_rec(array, n)
    puts "#{array}"
    return array if n == 0
    array[-2] ? array << array[-1] + array[-2] : array << array[-1]
    fibs_rec(array, n-1)
end

fibs_rec([1], 5)