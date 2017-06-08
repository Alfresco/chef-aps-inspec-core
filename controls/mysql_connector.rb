db_engine = node.content['aps-core']['db']['engine']
mysql_driver_version = node.content['aps-core']['mysql_driver']['version']

control 'mysql-connector' do
  impact 0.9
  title 'Check existance of mysql-connector'
  only_if { db_engine == 'mysql' }

  describe file("/usr/share/tomcat/lib/mysql-connector-java-#{mysql_driver_version}.jar") do
    it { should exist }
    it { should be_file }
    its('mode') { should cmp '0740' }
    its('owner') { should cmp 'tomcat' }
    its('group') { should cmp 'tomcat' }
    it { should be_readable.by_user('tomcat') }
    it { should be_writable.by_user('tomcat') }
    it { should be_executable.by_user('tomcat') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end
end
