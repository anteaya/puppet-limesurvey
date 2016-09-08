require 'spec_helper'
require 'hiera'

describe 'limesurvey' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
                      :root_home => '/root'
                    })
      end


      context 'with default values for all parameters' do
        let(:params) {{
                        :manage_webserver => false,
                        :manage_database => false,
                        :manage_php => false,
                      }}

        it { should contain_class('limesurvey') }
        it { should contain_class('limesurvey::extract') }
        it { is_expected.to compile.with_all_deps }
      end


      context 'with manage database' do
        let(:params) {{
                        :manage_database => true,
                      }}

        it { should contain_class('limesurvey::database') }
        it { is_expected.to compile.with_all_deps }
      end


      context 'with manage php' do
        let(:params) {{
                        :manage_php => true,
                      }}

        it { should contain_class('limesurvey::php') }
        it { is_expected.to compile.with_all_deps }
      end


      context 'with manage webserver' do
        let(:params) {{
                        :manage_webserver => true,
                      }}

        it { should contain_class('limesurvey::webserver') }
        it { is_expected.to compile.with_all_deps }
      end

    end
  end
end
