require 'spec_helper'
describe 'cloud_setup' do

  context 'with defaults for all parameters' do
    it { should contain_class('cloud_setup') }
  end
end
