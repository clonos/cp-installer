require 'spec_helper'
describe 'clonos_network' do
  context 'with default values for all parameters' do
    it { should contain_class('clonos_network') }
  end
end
