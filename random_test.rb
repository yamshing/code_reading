# encoding: utf-8
require_relative('rb')

num_arr = []
node_arr = []
random = Random.new
while num_arr.size < 10 do
	num = random.rand(2...50)
	if num_arr.index(num) == nil
		num_arr.push num
	end
end
 
#num_arr = [26, 34, 36, 20, 22, 49, 25, 17, 18, 24]
num_arr = [36, 35, 5, 8, 42, 16, 29, 11, 47, 17]
pp num_arr

 
node_template = {:node=> {:val=>0,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
	 
root = {:node=> {:val=>1,:is_red=>false,:cmp=>0},:left=>nil, :right=>nil}
rb = RedBlackTree.new(root)
 
for num in num_arr 
	node = {:node=> {:val=>num,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
	node_arr.push node
	rb.insert node
end

for del_num in (0..3)
	 
	pp "del!! #{del_num} #{node_arr[del_num]}"
	rb.remove node_arr[del_num]
	 
end

rb.pretty_print_all()