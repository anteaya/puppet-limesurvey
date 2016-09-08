require 'spec_helper_acceptance'

describe 'limesurvey' do

  context 'with defaults' do
    it 'should idempotently run' do
      pp = <<-EOS
        class { 'limesurvey':
         dbname            => 'limesurvey',
         dbpassword        => 'foobar',
         dbuser            => 'lemongrab',
         sql_root_password => 'foobar',
         www_user          => 'www-data',
         www_group         => 'www-data',
         manage_webserver  => false,
         manage_database   => true,
         manage_php        => true,
        }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

  context 'files provisioned' do
    describe file('/opt/limesurvey') do
      it { should be_directory }
      it { should be_owned_by 'www-data' }
      it { should be_grouped_into 'www-data' }
    end

    describe file('/opt/limesurvey/tmp') do
      it { should be_directory }
      it { should be_owned_by 'www-data' }
      it { should be_grouped_into 'www-data' }
    end
  end

end
