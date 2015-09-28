require 'rails_helper'
 RSpec.describe Rating_association, type: :model do
   it { should belong_to :rateable }
 end
