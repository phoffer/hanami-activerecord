require 'spec_helper'
require_relative '../../../lib/hanami_activerecord/entities/user.rb'

describe Web::Controllers::Home::Index do
  let(:user) { User.new(email: 'asdf@asdf.com') }

  it 'is an ApplicationRecord descendent' do
    assert_kind_of ApplicationRecord, user
    assert_kind_of User, user
  end
end
