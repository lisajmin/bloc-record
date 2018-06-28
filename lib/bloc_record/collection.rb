module BlocRecord
  class Collection < Array
    def update_all(updates)
      ids = self.map(&:id)
      self.any? ? self.first.class.update(ids, updates) : false
    end

    def take(num=1)
      if num > 1
        self[0..(num-1)]
      else
        self.first
      end
    end

    def where(arg)
      target_key = arg.keys[0]
      self.select { |obj| obj[target_key] == arg[target_key] }
    end

    def not(arg)
      target_key = arg.keys[0]
      self.select { |obj| obj[target_key] != arg[target_key] }
    end

    def destroy_all
      ids = self.map(&:id)
      self.any? ? self.first.class.destroy(ids) : false
    end
  end
end
