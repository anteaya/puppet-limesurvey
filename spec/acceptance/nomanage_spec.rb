require 'spec_helper_acceptance'

describe 'limesurvey' do

  context 'apply without manage_' do
    it 'should idempotently run' do
      pp = <<-EOS
        class { 'limesurvey':
         www_user          => 'www-data',
         www_group         => 'www-data',
         manage_webserver  => false,
         manage_database   => false,
         manage_php        => false,
        }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

end
