require 'spec_helper'
describe 'tsw_chocolatey' do
  context 'with default values for all parameters' do
    it { should contain_class('tsw_chocolatey') }
  end
end
