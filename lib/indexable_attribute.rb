require "indexable_attribute/version"
require "active_support"
require "active_record"

module IndexableAttribute
  extend ActiveSupport::Concern
	module ClassMethods
      def indexable_attribute(attr_acc, attr_list, attr_name=nil)
      	attr_name = attr_acc unless attr_name
      	unless @create_overriden
      		def self.create(*lst)
				objs = []
				lst.each do |item|
					obj = self.new
					item.each do |k,v|
						class_eval %Q{
							obj.#{k} = v
						}
					end
					obj.save
					objs.push(obj)
				end
				objs.count > 1 ? objs : objs[0]
			end
      		@create_overriden = true
      	end
      	_CNST = attr_acc.to_s.upcase
      	_ATTR = attr_acc.to_s.downcase
      	_ATTR_ID = attr_name.to_s.downcase
        class_eval %Q{
        	#{_CNST} = #{attr_list.map { |i| i.to_sym }.to_s}

			def #{_ATTR}
				#{_CNST}[self[:#{_ATTR_ID}]]
			end

			def #{_ATTR}=(v)
				self[:#{_ATTR_ID}] = #{_CNST}.index(v.to_sym)
			end
	    }
      end
    end
end

ActiveRecord::Base.send :include, IndexableAttribute