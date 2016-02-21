require 'spec_helper'
describe 'osmirror' do

  context 'with defaults for all parameters' do
    it { should contain_class('osmirror') }
  end
end
