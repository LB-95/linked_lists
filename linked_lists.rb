class LinkedList
    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        node = Node.new(value)
        if @head.nil?
            @head = node
        else
            @tail.next_node = @head
        end
        @tail = node
    end

    def prepend(value)
        node = Node.new(value)
        if @tail.nil?
            @tail = node
        else
            node.next_node = @head
        end
        @head = node
    end

    def size
        size = Node.new
        size.count
    end

    def head
        @head.value
    end
    
    def tail
        @tail.value
    end

    def at(index)
    current_node = @head
    index.times {current_node = current_node.next_node}
    puts current_node.next_node
    end

    def pop
        if @head == @tail
            @head.value = nil
            @size = 0
        else
            Node.count -=1
            new_node = @head
            until next_node.next_node == @tail do
                new_node = new_node.next_node
            end
            new_node.next_node = nil
            @tail = new_node
        end
    end
    
    def contains(value)
        new_node = @head
        found = false
        until found == true do
            if value == new_node.value
                found = true
            else
                new_node = new_node.next_node
            end
        end
        found
    end

    def find(value)
        index = 0
        next_node = @head
        while index < (self.size-1)
            return index if index == self.size
            index +=1
        end
    end

    def to_s
        pos = @head
        output =""
        while pos != nil
            output += "( #{pos.value} ) -> "
            pos = pos.next_node
        end
        output += "nil"
        output
    end
    def insert_at(value, index) 
        previous_node = self.at(index-1)
        new_node = Node.new(value)
    
        new_node.next_node = previous_node.next_node
        previous_node.next_node = new_node
    end
    def remove_at(index)
        output = self.at(index)
        previous_node = self.at(index-1)
        new_next_node = self.at(index+1)
    
        previous_node.next_node = new_next_node
    
        output
      end
end

class Node
    attr_accessor :value, :next_node

    @@count = 0

    def initialize(value = nil)
        @@count +=1
        @value = nil
        @next_node = nil
    end

    def self.count
        @@count
    end
end