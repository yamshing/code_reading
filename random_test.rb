# encoding: utf-8
require_relative('rb')

num_arr = []
random = Random.new
while num_arr.size < 10 do
	num = random.rand(2...50)
	if num_arr.index(num) == nil
		num_arr.push num
	end
end
 
#num_arr = [26, 34, 36, 20, 22, 49, 25, 17, 18, 24]
 
node_template = {:node=> {:val=>0,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
	 
root = {:node=> {:val=>1,:is_red=>false,:cmp=>0},:left=>nil, :right=>nil}
rb = RedBlackTree.new(root)
 
for num in num_arr 
	node = {:node=> {:val=>num,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
	rb.insert node
end

rb.pretty_print_all()
