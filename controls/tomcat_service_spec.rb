services = ['tomcat-activiti']

control 'Tomcat Service' do
  impact 0.7
  title 'Check tomcat is running'

  describe 'Tomcat' do
    services.each do |service|
      it "Has a running #{service} service" do
        expect(service(service)).to be_running
      end
    end
  end
end
