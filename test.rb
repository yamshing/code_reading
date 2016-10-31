# encoding: utf-8
require 'test/unit'
require_relative('rb')
 
class TestSample < Test::Unit::TestCase
	 
	def setup

	end
	 
	def test_insert_1
		root = {:node=> {:val=>0,:is_red=>false,:cmp=>0},:left=>nil, :right=>nil}
		node1 = {:node=> {:val=>5,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		node2 = {:node=> {:val=>10,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}

		rb = RedBlackTree.new(root)
		rb.insert(node1)
		rb.insert(node2)
		#rb.print_all()

		assert_equal "[[\"5○ \"], [\"0○ 10○ \"], [\"--\", \"--\"]]", rb.to_s()
		 
	end
	def test_insert_2
		 
		root = {:node=> {:val=>10,:is_red=>false,:cmp=>0},:left=>nil, :right=>nil}
		node1 = {:node=> {:val=>5,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		node2 = {:node=> {:val=>0,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		 
		rb = RedBlackTree.new(root)
		rb.insert(node1)
		rb.insert(node2)
		#rb.print_all()

		assert_equal  "[[\"5○ \"], [\"0○ 10○ \"], [\"--\", \"--\"]]", rb.to_s()
		 
	end

	def test_insert_3
		 
		#root =  {:val=>0, :left=>nil, :right=>nil, :is_red=>false, :cmp=>0 , :node=>nil}
		#node1 = {:val=>10, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0 , :node=>nil}
		#node2 = {:val=>5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0  , :node=>nil}
		#node3 = {:val=>6, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0  , :node=>nil}
		#node4 = {:val=>7, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0  , :node=>nil}
		#node5 = {:val=>8, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0  , :node=>nil}
		#node6 = {:val=>9.5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0, :node=>nil}
		#node7 = {:val=>9.7, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0, :node=>nil}
		#node8 = {:val=>3, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0  , :node=>nil}
		#node9 = {:val=>8.5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0, :node=>nil}
		 
		root = {:node=> {:val=>0,:is_red=>false,:cmp=>0},:left=>nil, :right=>nil}
		node1 = {:node=> {:val=>10,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		node2 = {:node=> {:val=>5,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		node3 = {:node=> {:val=>6,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		node4 = {:node=> {:val=>7,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		node5 = {:node=> {:val=>8,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		node6 = {:node=> {:val=>9.5,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		node7 = {:node=> {:val=>9.7,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		node8 = {:node=> {:val=>3,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		node9 = {:node=> {:val=>8.5,:is_red=>true,:cmp=>0},:left=>nil, :right=>nil}
		 

		rb = RedBlackTree.new(root)
		 
		rb.insert(node1)
		rb.insert(node2)
		rb.insert(node3)
		rb.insert(node4)
		rb.insert(node5)
		rb.insert(node6)
		rb.insert(node7)
		rb.insert(node8)
		rb.insert(node9)
		 
		#rb.print_all()

		assert_equal "[[\"7○ \"], [\"5○ 9.5○ \"], [\"3○ 6○ \", \"8.5○ 10○ \"], [\"0●  -\", \"--\", \"8●  -\", \"9.7●  -\"], [\"--\", \"--\", \"--\"]]", rb.to_s()
		 
	end
end



			 
#remove #1
#root =  {:val=>1, :left=>nil, :right=>nil, :is_red=>false, :cmp=>0}
#node = {:val=>2, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node1 = {:val=>1.5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#node2 = {:val=>1.8, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#root = insert(root, node)
#root = insert(root, node1)
#root = insert(root, node2)
#remove(root,node2)

#remove #2
#	root =  {:val=>10, :left=>nil, :right=>nil, :is_red=>false, :cmp=>0}
#	node = {:val=>20, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#	node1 = {:val=>15, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#	node2 = {:val=>30, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#	node3 = {:val=>14, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#	node4 = {:val=>13, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#	node5 = {:val=>13.5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
#	rb = RedBlackTree.new(root)
#	rb.insert(node)
#	rb.insert(node1)
#	rb.insert(node2)
#	rb.insert(node3)
#	rb.insert(node4)
#	rb.insert(node5)
#	 
#	rb.remove(node3)
#	 
#	p (rb.to_s() == "[[\"15○ \"], [\"13○ 30○ \"], [\"10●  -\", \"20●  -\"], [\"--\", \"--\"]]")
#	#root = insert(root, node1)
#	#root = insert(root, node2)
#	#root = insert(root, node3)
#	#root = insert(root, node4)
#	#root = insert(root, node5)
#	#remove(root,node3)
#
#	#print_rb(root, 0, '')
#	#@node_arr.each do |n|
#	#	pp n
#	#end
#end


