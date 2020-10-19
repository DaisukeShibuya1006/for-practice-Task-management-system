
10000.times do |n|
   Task.create(title: "test#{n+1}", status: rand(0..2))
end