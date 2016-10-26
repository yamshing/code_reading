# encoding: utf-8
# red black tree algorithm from rb.h of libc in freebsd
# REF:yamshing.hatenablog.com/entry/2015/09/30/205603
require('pp')

def comp(a, b)
	 
	(b[:val] - a[:val]) > 0 ? 1 : (b[:val] - a[:val] == 0) ? 0 : -1
	 
end

def rotate_left(pivot)
	right = pivot[:right]
	left = pivot[:left]
	pivot[:right] = right[:left]
	right[:left] = pivot
	 
	right
end
 
def rotate_right(pivot)
	left = pivot[:left] 
	left_right = left[:right]
	pivot[:left] = left_right
	left[:right] = pivot
	 
	left
end

def remove(root, remove_node)
	path_arr_i = 0
	nodep_i = 0
	path_arr = []
	path_arr[path_arr_i] = root
	
	while path_arr[path_arr_i] do
		# CALL comp TO FLATTEN TREE TO ARRAY
		cmp = path_arr[path_arr_i][:cmp] = comp(path_arr[path_arr_i], remove_node)
		 
		if cmp < 0
			path_arr[(path_arr_i + 1)] = path_arr[path_arr_i][:left]
		else
			path_arr[(path_arr_i + 1)] = path_arr[path_arr_i][:right]
			if cmp == 0
				if path_arr[(path_arr_i + 1)]
					path_arr[(path_arr_i + 1)][:cmp] = 1
				end
				 
				nodep_i = (path_arr_i + 1)
				 
				path_arr_i += 1
				 
				while path_arr[(path_arr_i)]
					path_arr[(path_arr_i)][:cmp] = -1
					path_arr[(path_arr_i + 1)] = path_arr[path_arr_i][:left]
					path_arr_i += 1
				end
				 
				break
			end
		end
		path_arr_i += 1
	end
	path_arr_i -= 1
	 
	if comp(path_arr[path_arr_i], remove_node) != 0
		#remove node is not the last node
		#swap
		is_red = path_arr[path_arr_i][:is_red]
		path_arr[path_arr_i][:is_red] = remove_node[:is_red]
		path_arr[path_arr_i][:left] = remove_node[:left]
		path_arr[path_arr_i][:right] = remove_node[:right]
		remove_node[:is_red] = is_red
		path_arr[nodep_i] = path_arr[path_arr_i]
		path_arr[path_arr_i] = remove_node
		 
		if nodep_i == 0
			root = path_arr[nodep_i]
		else
			if path_arr[nodep_i - 1][:cmp] < 0
				path_arr[nodep_i - 1][:left] = path_arr[nodep_i]
			else
				path_arr[nodep_i - 1][:right] = path_arr[nodep_i]
			end
		end
	else
		#test 2
		#remove node is the last node
		if remove_node[:left] != nil
			#test 3
			p "TODO"
		elsif nodep_i == 0
			#only one node
			root = nil
			return
		end
	end
	pp path_arr[path_arr_i]
	if path_arr[path_arr_i][:is_red]
		path_arr[path_arr_i - 1][:left] = nil
		return
	else
		p "TODO else red"
	end
end
 
def insert(root, insert_node)
	path_arr_i = 0
	path_arr = []
	path_arr[path_arr_i] = root
	
	while path_arr[path_arr_i] do
		 
		# CALL comp TO FLATTEN TREE TO ARRAY
		cmp = path_arr[path_arr_i][:cmp] = comp(path_arr[path_arr_i], insert_node)
		 
		if cmp < 0
			 
			path_arr[(path_arr_i + 1)] = path_arr[path_arr_i][:left]
			 
		else
			 
			path_arr[(path_arr_i + 1)] = path_arr[path_arr_i][:right]
			 
		end
		 
		path_arr_i += 1
		 
	end
	 
	path_arr[path_arr_i] = insert_node
	path_arr_i -= 1
	 
	while path_arr_i >= 0 do
		 
		#WITH cmp WE SET LEFT OR RIGHT
		cnode = path_arr[path_arr_i]
		 
		#p "cnode",cnode
		if cnode[:cmp] < 0
			#------------------------------ left child
			left = path_arr[path_arr_i + 1]
			cnode[:left] = left
			 
			if left[:is_red] 
				if left[:left] && left[:left][:is_red]
					 
					left[:left][:is_red] = false
					new_root = rotate_right(path_arr[path_arr_i])
					cnode = new_root
					 
				end
				 
			else
				 
				break 
				 
			end
			 
		else
			#------------------------------ right child
			right = path_arr[path_arr_i + 1]
			#pp right
			cnode[:right] =  right
			left = cnode[:left]
			 
			if right[:is_red]
				 
				if left && left[:is_red]
					right[:is_red] = false
					left[:is_red] = false
					cnode[:is_red] = true
			 
				else
					cnode_is_red = cnode[:is_red]
					new_root = rotate_left(path_arr[path_arr_i])
					new_root[:is_red] = cnode_is_red
					cnode[:is_red] = true
					cnode = new_root
					 
				end
				 
			else
				break
				 
			end
		end

		path_arr[path_arr_i] = cnode
		path_arr_i -= 1
	end
	 
	path_arr[0][:is_red] = false 
	path_arr[0]
	 
end
 
@node_arr = []
 
#------------------------------
# print routine
#------------------------------

def get_node_color_str(node,  pos)
	color = '○ '
	if node[:is_red]
		color = '●  '
	end
	
	"#{node[:val]}#{color}"
end
 
def print_rb(root, level, pos)
	node_str = get_node_color_str(root, pos)
	 
	if level == 0
		 
		@node_arr[level] ||= []
		@node_arr[level].push "#{node_str}"
		 
	end
	 
	left_node_str =  '-'
	right_node_str = '-'

	if root[:left]
		 
		left_node_str = print_rb(root[:left], level + 1, "#{root[:val]}-l")
		 
	end
	 
	if root[:right]
		 
		right_node_str = print_rb(root[:right], level + 1, "#{root[:val]}-r")
		 
	end
	
	@node_arr[level + 1] ||= []
	@node_arr[level + 1].push "#{left_node_str}#{right_node_str}"
	 
	node_str
end

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

#test #3
root =  {:val=>10, :left=>nil, :right=>nil, :is_red=>false, :cmp=>0}
node = {:val=>20, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
node1 = {:val=>15, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
node2 = {:val=>30, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
node3 = {:val=>14, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
node4 = {:val=>13, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
node5 = {:val=>13.5, :left=>nil, :right=>nil, :is_red=>true, :cmp=>0}
root = insert(root, node)
root = insert(root, node1)
root = insert(root, node2)
root = insert(root, node3)
root = insert(root, node4)
root = insert(root, node5)
remove(root,node3)


print_rb(root, 0, '')
 
@node_arr.each do |n|
	pp n
end





