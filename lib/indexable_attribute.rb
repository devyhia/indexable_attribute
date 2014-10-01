require "indexable_attribute/version"
require "active_support"
require "active_record"

module IndexableAttribute
  extend ActiveSupport::Concern
	module ClassMethods
      def indexable_attribute(attr_name, attr_list, has_id=true)
      	_CNST = attr_name.to_s.upcase
      	_ATTR = attr_name.to_s.downcase
      	_ATTR_ID = has_id ? _ATTR + '_id' : _ATTR
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