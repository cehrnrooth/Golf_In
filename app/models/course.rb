class Course < ActiveRecord::Base
  
  attr_accessible :name,
                  :holes,
                  :yards,
                  :par,
                  :facility,
                  :street,
                  :city,
                  :state,
                  :zip,
                  :phone,
                  :link,
                  :description
    
end
