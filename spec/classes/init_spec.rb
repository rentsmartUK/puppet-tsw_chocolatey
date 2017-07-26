require 'spec_helper'
describe 'custom_chocolatey' do
  context 'with default values for all parameters' do
    it { should contain_class('custom_chocolatey') }
  end
end
