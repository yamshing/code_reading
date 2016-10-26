require 'minitest/unit'
require_relative('rb')
 
#root = {:val=>0, :left=>nil, :right=>nil, :is_red=>false, :cmp=>0}
#node1 = {:val=>5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node2 = {:val=>10, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#root = insert(root, node1)
#root = insert(root, node2)
 
#root = {:val=>0, :left=>nil, :right=>nil, :is_red=>false, :cmp=>0}
#node1 = {:val=>-5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node2 = {:val=>-10, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#root = insert(root, node1)
#root = insert(root, node2)
 
#------------------------------
#root =  {:val=>0, :left=>nil, :right=>nil, :is_red=>false, :cmp=>0}
#node1 = {:val=>10, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node2 = {:val=>5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node3 = {:val=>6, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node4 = {:val=>7, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node5 = {:val=>8, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node6 = {:val=>9.5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node7 = {:val=>9.7, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node8 = {:val=>3, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node9 = {:val=>8.5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
# 
#root = insert(root, node1)
#root = insert(root, node2)
#root = insert(root, node3)
#root = insert(root, node4)
#root = insert(root, node5)
#root = insert(root, node6)
#root = insert(root, node7)
#root = insert(root, node8)
#root = insert(root, node9)
#------------------------------
			 
#remove #1
#root =  {:val=>1, :left=>nil, :right=>nil, :is_red=>false, :cmp=>0}
#node = {:val=>2, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node1 = {:val=>1.5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node2 = {:val=>1.8, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#root = insert(root, node)
#root = insert(root, node1)
#root = insert(root, node2)
#remove(root,node2)

def test_3
	root =  {:val=>10, :left=>nil, :right=>nil, :is_red=>false, :cmp=>0}
	node = {:val=>20, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
	node1 = {:val=>15, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
	node2 = {:val=>30, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
	node3 = {:val=>14, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
	node4 = {:val=>13, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
	node5 = {:val=>13.5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
	rb = RedBlackTree.new(root)
	rb.insert(node)
	rb.insert(node1)
	rb.insert(node2)
	rb.insert(node3)
	rb.insert(node4)
	rb.insert(node5)
	rb.remove(node3)
	rb.print_all()
	#root = insert(root, node1)
	#root = insert(root, node2)
	#root = insert(root, node3)
	#root = insert(root, node4)
	#root = insert(root, node5)
	#remove(root,node3)

	#print_rb(root, 0, '')
	#@node_arr.each do |n|
	#	pp n
	#end
end
 
test_3

