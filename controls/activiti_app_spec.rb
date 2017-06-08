db_engine = node.content['aps-core']['db']['engine']

control 'Activiti app and properties' do
  impact 0.7
  title 'Tomcat configuration'
  desc 'Checks Tomcat connection'

  describe file('/usr/share/tomcat/lib/activiti-app.properties') do
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
    its('content') { should match 'hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect' } if db_engine == 'postgres'
    its('content') { should match 'hibernate.dialect=org.hibernate.dialect.MySQLDialect' } if db_engine == 'mysql'
    its('content') { should match 'datasource.driver=org.postgresql.Driver' } if db_engine == 'postgres'
    its('content') { should match 'datasource.driver=com.mysql.jdbc.Driver' } if db_engine == 'mysql'
  end

  describe file('/usr/share/tomcat/webapps/activiti-app.war') do
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
