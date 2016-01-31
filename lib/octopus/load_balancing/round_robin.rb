require 'octopus/load_balancing'

# The round-robin load balancing of slaves belonging to the same shard.
# It is a pool that contains slaves which queries are distributed to.
module Octopus
  module LoadBalancing
    class RoundRobin
      def initialize(slaves_list)
        @slaves_list = slaves_list
        @slave_index = 0
      end

      # Returns the next available slave in the pool
      def next(options)
        puts "got to next and options is #{options.inspect}"
        @slaves_list[@slave_index = (@slave_index + 1) % @slaves_list.length]
      end
    end
  end
end
