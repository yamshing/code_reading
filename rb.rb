# encoding: utf-8
# red black tree algorithm from rb.h of libc in freebsd
# REF:yamshing.hatenablog.com/entry/2015/09/30/205603
require('pp')

class RedBlackTree
	def initialize(root)
		@root = root 
		@node_arr = []
		 
	end
	def comp(a, b)
		 
		(b[:node][:val] - a[:node][:val]) > 0 ? 1 : (b[:node][:val] - a[:node][:val] == 0) ? 0 : -1
		 
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

	def remove(remove_node)
		root = @root
		path_arr_i = 0
		nodep_i = 0
		path_arr = []
		path_arr[path_arr_i] = root
		
		while path_arr[path_arr_i] do
			# CALL comp TO FLATTEN TREE TO ARRAY
			cmp = path_arr[path_arr_i][:node][:cmp] = comp(path_arr[path_arr_i], remove_node)
			 
			if cmp < 0
				path_arr[(path_arr_i + 1)] = path_arr[path_arr_i][:left]
			else
				path_arr[(path_arr_i + 1)] = path_arr[path_arr_i][:right]
				if cmp == 0
					if path_arr[(path_arr_i)]
						path_arr[(path_arr_i)][:node][:cmp] = 1
					end
					 
					nodep_i = (path_arr_i)
					 
					#path_arr_i += 1
					 
					while path_arr[(path_arr_i)]
						#pp "in while",path_arr[(path_arr_i)]
						path_arr[(path_arr_i)][:node][:cmp] = -1
						path_arr[(path_arr_i + 1)] = path_arr[path_arr_i][:left]
						path_arr_i += 1
					end
					 
					break
				end
			end
			path_arr_i += 1
		end
		#pp 'path_arr', path_arr
		 
		path_arr_i -= 1
		#pp "path_arr[path_arr_i]",path_arr[path_arr_i]
		#pp "remove node", remove_node
		 
		if comp(path_arr[path_arr_i], remove_node) != 0
			# remove node is not the last node
			#swap
			is_red = path_arr[path_arr_i][:node][:is_red]
			path_arr[path_arr_i][:node][:is_red] = remove_node[:node][:is_red]
			path_arr[path_arr_i][:left] = remove_node[:left]
			path_arr[path_arr_i][:right] = remove_node[:right]
			remove_node[:node][:is_red] = is_red
			path_arr[nodep_i] = path_arr[path_arr_i]
			path_arr[path_arr_i] = remove_node
			 
			if nodep_i == 0
				root = path_arr[nodep_i]
			else
				if path_arr[nodep_i - 1][:node][:cmp] < 0
					path_arr[nodep_i - 1][:left] = path_arr[nodep_i]
				else
					path_arr[nodep_i - 1][:right] = path_arr[nodep_i]
				end
			end
		else
			#remove node is the last node
			 
			if remove_node[:left] != nil
				 
				remove_node[:left][:node][:is_red] = false
				 
				if nodep_i == 0
					 
					root = remove_node[:left]
					 
				else
					 
					if path_arr[nodep_i - 1][:node][:cmp] < 0
						 
						path_arr[nodep_i - 1][:left] = remove_node[:left]
						 
					else
						 
						#test_remove_1
						path_arr[nodep_i - 1][:right] = remove_node[:left]

						#pp 'remove node'
						#pp remove_node
						#pp '------------------------------'
						#pp path_arr[nodep_i - 1]
						 
					end
				end
			elsif nodep_i == 0
				#only one node
				root = nil
				return
			end
		end
		 
		if path_arr[path_arr_i][:node][:is_red]
			path_arr[path_arr_i - 1][:left] = nil
			return
		end
		# remove node is black
		#pp 'remove node', path_arr[path_arr_i]
		#pp "path_arr", path_arr[path_arr_i]
		 
		path_arr[path_arr_i] = nil

		path_arr_i -= 1

		while(path_arr_i >= 0) do
			 
			if path_arr[path_arr_i][:node][:cmp] < 0
				#left node
				pp "left node removed"
				path_arr[path_arr_i][:left] =  path_arr[path_arr_i + 1]
				tnode  = nil
				 
				if path_arr[path_arr_i][:node][:is_red]
					pp "path is red"
					
					right = path_arr[path_arr_i][:right]
					rightleft = right[:left]

					if rightleft && rightleft[:node][:is_red]
						pp "rightleft is red"
						path_arr[path_arr_i][:node][:is_red] = false
						tnode = rotate_right(path_arr[path_arr_i][:right])
						path_arr[path_arr_i][:right] = tnode
						tnode = rotate_left(path_arr[path_arr_i])
						 
					else
						pp "rightleft is not red"
						tnode = rotate_left(path_arr[path_arr_i])

					end

					if path_arr[path_arr_i - 1][:node][:cmp] < 0
						pp "-1 cmp < 0"
						path_arr[path_arr_i - 1][:left] = tnode
					else
						pp "-1 cmp > 0"
						path_arr[path_arr_i - 1][:right] = tnode
					end
					return
					 
				else
					pp "path is not red"
					right = path_arr[path_arr_i][:right]
					rightleft = right[:left] 
					 
					if rightleft && rightleft[:node][:is_red]
						pp "rightleft is red" #test remove_6
						 
						tnode = nil
						rightleft[:node][:is_red] = false
						tnode = rotate_right(path_arr[path_arr_i][:right])
						path_arr[path_arr_i][:right] = tnode
						tnode = rotate_left(path_arr[path_arr_i])
						 
						if path_arr_i == 0
							
							path_arr[0] = tnode
							 
						else
							 
							if path_arr[path_arr_i - 1][:node][:cmp] < 0
								pp "-1 cmp < 0"
								path_arr[path_arr_i - 1][:left] = tnode
							else
								pp "-1 cmp > 0"
								path_arr[path_arr_i - 1][:right] = tnode
							end
							 
						end
						 
						return
						 
					else
						pp "rightleft is not red"
						path_arr[path_arr_i][:node][:is_red] = true
						tnode = rotate_left(path_arr[path_arr_i])
						path_arr[path_arr_i] = tnode
					end
					
				end
				 
				if path_arr[path_arr_i - 1][:node][:cmp] < 0
					pp "-1 cmp < 0"
					path_arr[path_arr_i - 1][:left] = tnode
				else
					pp "-1 cmp > 0"
					path_arr[path_arr_i - 1][:right] = tnode
				end
				return

			else
				#right node
				pp "right node removed"
				 
				path_arr[path_arr_i][:right] =  path_arr[path_arr_i + 1]
				 
				left = path_arr[path_arr_i][:left]
				 
				pp "left node", left
				if left[:node][:is_red]
					pp "left is red"
					#TODO
				elsif path_arr[path_arr_i][:node][:is_red]
					pp "left is not red i node is red"
					leftleft = left[:left]
					if leftleft && leftleft[:node][:is_red] 
						pp "leftleft is red"
						#TODO
					else
						 
						left[:node][:is_red] = true
						path_arr[path_arr_i][:node][:is_red] = false
					end
					 
				else
					pp "left is not red i node is not red"
					left[:node][:is_red] = true
				end
			end
			 
			path_arr_i -= 1
			 
		end
	end
	 
	def insert(insert_node)
		path_arr_i = 0
		path_arr = []
		path_arr[path_arr_i] = @root
		
		while path_arr[path_arr_i] do
			 
			# CALL comp TO FLATTEN TREE TO ARRAY
			cmp = path_arr[path_arr_i][:node][:cmp] = comp(path_arr[path_arr_i], insert_node)
			 
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
			if cnode[:node][:cmp] < 0
				#------------------------------ left child
				left = path_arr[path_arr_i + 1]
				cnode[:left] = left
				 
				if left[:node][:is_red] 

					if left[:left] && left[:left][:node][:is_red]
						 
						left[:left][:node][:is_red] = false
						new_root = rotate_right(cnode)
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
				 
				if right[:node][:is_red]
					 
					if left && left[:node][:is_red]
						right[:node][:is_red] = false
						left[:node][:is_red] = false
						cnode[:node][:is_red] = true
				 
					else
						cnode_is_red = cnode[:node][:is_red]
						new_root = rotate_left(path_arr[path_arr_i])
						new_root[:node][:is_red] = cnode_is_red
						cnode[:node][:is_red] = true
						cnode = new_root
						 
					end
					 
				else
					break
					 
				end
			end

			path_arr[path_arr_i] = cnode
			path_arr_i -= 1
		end
		 
		path_arr[0][:node][:is_red] = false 
		 
		@root = path_arr[0]
		 
	end
	 
	 
	#------------------------------
	# print routine
	#------------------------------

	def get_node_color_str(node,  pos)
		 
		if !node[:node]
			return ''
		end

		color = '○ '
		if node[:node][:is_red]
			color = '●  '
		end
		
		"#{node[:node][:val]}#{color}"
	end
	 
	def to_s()
		@node_arr = []
		print_rb(@root,0,'')
		@node_arr.to_s()
	end
	 
	def print_all()
		 
		@node_arr = []
		 
		print_rb(@root,0,'')

		@node_arr.each do |n|
			pp n
		end
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
			 
			left_node_str = print_rb(root[:left], level + 1, "")
			 
		end
		 
		if root[:right]
			 
			right_node_str = print_rb(root[:right], level + 1, "#")
			 
		end
		
		@node_arr[level + 1] ||= []
		@node_arr[level + 1].push "#{left_node_str}#{right_node_str}"
		 
		node_str
	end
	 
end






