db_engine = node.content['aps-core']['db']['engine']

control 'postgres-connector' do
  impact 0.9
  title 'Check existance of postgres-connector'
  only_if { db_engine == 'postgres' }

  describe file("/usr/share/tomcat/lib/postgresql.jar") do
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
