# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        self.max - self.min if !self.empty?
    end

    def average
        self.sum / self.length.to_f if !self.empty?
    end

    def median
        if self.empty?
            return nil
        end
        
        if self.length.odd?
            @@i = (self.length / 2.0) - 0.5
            @@array = self.sort
            return @@array[@@i]
        elsif self.length.even?
            @@i, @@j = (self.length / 2.0), (self.length / 2.0) - 1
            @@array = self.sort
            return ((@@array[@@i] + @@array[@@j]) / 2.0)
        end
    end

    def counts
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        hash
    end

    #Part 2

    def my_count(value)
        count = 0
        self.each {|ele| count += 1 if ele == value}
        count
    end

    def my_index(value)
        i = 0
        while i < self.length
            return i if self[i] == value
            i += 1
        end
        nil
    end
    
    def my_uniq
        hash = {}
        self.each {|ele| hash[ele] = nil}
        hash.keys
    end

    def my_transpose
        i = 0
        array = Array.new(self.length) {Array.new}
        last = self[-1][-1]
        while array[-1][-1] != last
            self.each do |ele|
                array[i] << ele[i]
            end
            i += 1
        end
        array
    end
end
